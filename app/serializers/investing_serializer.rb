class InvestingSerializer < ActiveModel::Serializer
  attributes \
    :amount,      :deals_year,   :confirmed_deals, :visible,
    :market_list, :country_list, :currency_list
end
