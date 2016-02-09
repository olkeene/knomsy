class IndexCal
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
      raise UnknownObject, object
    end
  end
  
  private
  
  def process_company
    ([
      company_rmtcat,
      company_rmtcon,
      
      company_amstc,
      company_amstcon,
      
      company_asstcon,
      company_asstcat,
    ]
      .map{|v| v || 0 }
      .inject(&:+) / 6 * 0.7)
      .round(2)
  end
  
  def company_rmtcat
    avg_value categories.map(&:rmtcat)
  end
  
  def company_rmtcon
    country.rmtcon
  end
  
  def company_amstc
    avg_value categories.map(&:amstc)
  end
  
  def company_amstcon
    country.amstcon
  end
  
  def company_asstcon
    country.asstcon
  end
  
  def company_asstcat
    avg_value categories.map(&:asstcat)
  end
  
  def categories
    @categories ||= object.categories.to_a
  end
  
  def country
    @country ||= object.country
  end
  
  def avg_value(arr)
    (arr.inject{ |sum, el| sum + el }.to_f / arr.size).round(2)
  end
end