class Ability
  attr_reader :user

  class UnknownAction < StandardError; end
  class UnknownObject < StandardError; end
  
  def initialize(user)
    @user = user
  end
  
  def can?(action, what)
    return false unless user
    
    case what
    when User, UserDecorator
      process_user(action, what)
    when Company
      process_company(action, what)
    else
      raise UnknownObject, what
    end
  end
  
  private
  
  def process_user(action, test_user)
    case action
    when :edit
      test_user.id == user.id
    else
      raise_unknown(action)
    end
  end
  
  def process_company(action, company)
    case action
    when :edit
      company.owner?(user)
    when :took_survey
      return true
      
      # owner
      return false if company.owner?(user)
    else
      raise_unknown(action)
    end
  end

  def raise_unknown(action)
    raise UnknownAction, action
  end
end