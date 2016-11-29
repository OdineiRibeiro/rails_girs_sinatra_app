require 'json'
require 'httpclient'

require 'sinatra/config_file'
config_file '../config.yml'

module FirebaseApi
  def self.test
    request = HTTPClient.new({
                :base_url => settings.base_url,
                :default_header => {
                    'Content-Type' => 'application/json'
                }
              })
          
    request.request(:put, 'vote.json', {
        :body             => { 'name' => 'Oscar' }.to_json,
        :query            => { :auth => settings.api_key },
        :follow_redirect  => true
    })
  end
end
