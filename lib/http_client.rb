class HTTPClient
  def self.get(url)
    Net::HTTP.get(URI(url))
  end
end
