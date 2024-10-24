require "json"
require "net/http"

module TaxService
  class Client
    URL = "https://api.salestaxapi.ca/v1/total/all"

    def get_rates
      JSON.parse(Net::HTTP.get(URI(URL)))
    end
  end

  class << self
    def rates
      @rates ||= api_client.get_rates
    end

    alias_method(:load_rates, :rates)

    def download
      file.write(rates.to_json)
    end

    def read
      JSON.parse(file.read)
    end

    private

    def file
      Rails.root.join("db", "tax_rates.json")
    end

    def api_client
      @client ||= Client.new
    end
  end
end
