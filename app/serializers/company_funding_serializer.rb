class CompanyFundingSerializer < ActiveModel::Serializer
  attributes :id, :round, :humanized_round, :funded_on, :amount, :investor_list, :link, :link_desc, :visible
  
  def humanized_round
    object.round && object.round.humanize
  end
end
