require 'json'
require 'rest-client'

module FirebaseApi
  def self.push(payload)
    binding.pry
    JSON.parse(
      RestClient::Request.execute(
        method: :get,
        headers: { auth: '' },
        url: '',
        payload: payload.to_json
      )
    )
  end
end
