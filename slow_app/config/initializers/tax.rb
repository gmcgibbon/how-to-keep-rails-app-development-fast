Rails.configuration.to_prepare do
  TaxService.load_rates
end
