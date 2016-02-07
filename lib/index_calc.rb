class IndexCals
  attr_reader :object
  
  class UnknownObject < StandardError; end

  def initialize(object)
    @object = object
  end
  
  def calc
    case object
    # when User, UserDecorator
    #   process_user
    when Company
      process_company
    else
      raise UnknownObject, what
    end
  end
  
  private
  
  def process_company
    RMTCAT 
    RMTCON
    AMSTC
    AMSTCON
    ASSTCON
    ASSTCAT
    * 0.7
  end
end