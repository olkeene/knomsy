class CompanyFundingSerializer < ActiveModel::Serializer
  attributes :id, :round, :humanized_round, :funded_on, :amount, :investors, :link, :link_desc, :visible
  
  def humanized_round
    object.round && CompanyFunding.humanize_round(object.round)
  end
end
