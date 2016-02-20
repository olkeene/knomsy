omni_auth = YAML.load(File.read(Rails.root.join("config", "omniauth.yml")))[Rails.env].recursive_symbolize_keys!

Rails.application.config.middleware.use OmniAuth::Builder do
  provider :facebook, omni_auth[:facebook][:key], omni_auth[:facebook][:secret], scope: 'public_profile,email'
  provider :linkedin, omni_auth[:linkedin][:key], omni_auth[:linkedin][:secret]
  provider :twitter,  omni_auth[:twitter][:key],  omni_auth[:twitter][:secret]
end