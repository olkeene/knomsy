class Experience < ActiveRecord::Base
  enum role: [:founder, :investor, :employee, :education]
  
  belongs_to :user
  
  validates :user_id, :role, presence: true
  validates :company_name, :title, length: {minimum: 3, maximum: 255}
  validates :description, length: {maximum: 500}, allow_blank: true
  validates :started_at, :ended_at, date: true
  
  [:started_at, :ended_at].each do |attr|
    define_method "#{attr}=" do |v|
      begin
        write_attribute attr, Date.strptime(v, '%m/%d/%Y')
      rescue ArgumentError
        super(v)
      end
    end
  end
end
