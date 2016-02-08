window.Companies = {}

class Companies.Controller
  bind_new: ->
    AutocompleteMixin.autocomplete 'company_country_name',  'company_country_id',  url: Routes.countries_data_path(format: 'json', query: 'QUERY')
    AutocompleteMixin.autocomplete 'company_category_name', 'company_category_id', url: Routes.categories_data_path(format: 'json', query: 'QUERY')
    TokenizedAutocompleteMixin.tokenized_remote_autocomplete 'company_category_list', url: Routes.categories_data_path(format: 'json', query: 'QUERY')
