class CompanyFunding < ActiveRecord::Base
  enum round: [:seed, :a_series]
  
  belongs_to :company
  
  validates :company_id, :round,    presence: true
  validates :funded_on, date: true, presence: true
  
  validates :amount, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99_999_999_999}
  
  validates :link,      length: {minimum: 2, maximum: 255}, allow_blank: true, url: {allow_blank: true}
  validates :link_desc, length: {minimum: 2, maximum: 255}, allow_blank: true
  
  before_save :fetch_link_desc

  def investor_list=(v)
    return if v.blank? || !v.is_a?(String)
    
    self.investors = v.split(',')
  end
  
  def investor_list
    investors.join(',')
  end
  
  def funded_on=(v)
    return if v.blank?
    
    begin
      write_attribute :funded_on, Date.strptime(v, '%m/%d/%Y')
    rescue ArgumentError
      super(v)
    end
  end
  
  private
  
  #TODO move to background
  def fetch_link_desc
    return unless link_changed?
    
    self.link_desc = if link.present?
      (MetaInspector.new(link).title || '')[0..254]
    else
      nil
    end
  rescue MetaInspector::RequestError
    self.link_desc = nil
  end
end
