class SurveyQuestionDecorator < Draper::Decorator
  delegate_all

  def q
    company = context[:company]
    out = object.q
    
    out.scan(/%\w+/).each do |entry|
      case entry
      when '%NAME'
        out.gsub! /%NAME/, company.name
      when '%DATE'
        out.gsub! /%DATE/, company.founded_on.to_s(:db)
      when '%LOCATION'
        out.gsub! /%DATE/, company.location
      else
        raise "unknown: #{entry}"
      end
    end
    
    out
  end
end
