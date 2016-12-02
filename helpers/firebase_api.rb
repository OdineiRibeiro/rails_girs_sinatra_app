module FirebaseApi
  def self.put(path, body)
    puts 'Send a put to Firebase'.yellow

    request = HTTPClient.new(base_url: ENV['FIREBASE_BASE_URL'],
                             default_header: {
                               'Content-Type' => 'application/json'
                             })

    request.request(:put, path, body: body.to_json,
                                query: { auth: ENV['FIREBASE_API_KEY'] },
                                follow_redirect: true)
  end

  def self.get(path, body = '')
    puts 'Send a get to Firebase'.yellow

    request = HTTPClient.new(base_url: ENV['FIREBASE_BASE_URL'],
                             default_header: {
                               'Content-Type' => 'application/json'
                             })

    request.request(:get, path, body: body.to_json,
                                query: { auth: ENV['FIREBASE_API_KEY'] },
                                follow_redirect: true)
  end

  def self.clear_all
    FirebaseApi.put('votes.json', 'HAM' => 0,
                                  'PIZ' => 0,
                                  'CUR' => 0,
                                  'NOO' => 0)
  end
end
