class User < ActiveRecord::Base
  # Include default devise modules. Others available are:
  # :confirmable, :lockable, :timeoutable and :omniauthable
  devise :database_authenticatable, :registerable,
         :recoverable, :validatable, :confirmable
         
  validates :first_name, :last_name, presence: true, length: {minimum: 2, maximum: 50}
  
  def name
    "#{first_name} #{last_name}"
  end
end
