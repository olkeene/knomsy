class CompanyFunding < ActiveRecord::Base
  enum round: [
    :fff, 
    :pre_seed, :seed, 
    :a_series, :b_series, :c_series, :d_series, :e_series, :f_series,
    :ipo
  ]
  
  belongs_to :company, required: true
  
  validates :round, presence: true
  validates :funded_on, date: true, presence: true
  
  validates :amount, numericality: {only_integer: true, greater_than_or_equal_to: 0, less_than_or_equal_to: 99_999_999_999}
  
  validates :link,      length: {minimum: 2, maximum: 255}, allow_blank: true, url: {allow_blank: true}
  validates :link_desc, length: {minimum: 2, maximum: 255}, allow_blank: true
  
  before_save :fetch_link_desc
  
  class << self
    def humanized_rounds
      rounds.map do |round, v| 
        {value: round, name: humanize_round(round)}
      end
    end
    
    def humanize_round(round)
      case round
      when 'fff'      then 'FFF'
      when 'pre_seed' then 'PreSeed'
      when 'ipo'      then 'IPO'
      else
        round.humanize
      end
    end
  end

  # tmp accessors
  def investor_list=(v)
    return if v.blank? || !v.is_a?(String)
    
    self.investors = v.split(',')
  end
  
  def investor_list
    (investors || []).join(',')
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
