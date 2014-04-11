module MeoWallet
  class Client
    include HTTParty
    base_uri 'https://services.wallet.codebits.eu'
    headers 'Content-Type' => 'application/json'

    def initialize(secret)
      self.headers 'Authorization' => "WalletPT #{secret}"
    end

    def create_checkout(payment_data)
      self.post '/api/v2/checkout', body: payment_data.to_json
    end
  end
end
