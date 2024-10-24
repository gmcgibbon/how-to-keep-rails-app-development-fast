namespace(:tax) do
  task(download_rates: :environment) do
    TaxService.download
  end
end
