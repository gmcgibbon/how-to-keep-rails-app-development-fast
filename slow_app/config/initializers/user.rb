Rails.configuration.to_prepare do
  User.default_name = "Guest"
end
