class TankService
  
  def initialize
    @heights_stream = ActiveSupport::JSON.decode(connection.get.body)
  end
  
  def heights
    @heights_stream["heights"].dup
  end

  def request_body
    @heights_stream
  end
  
  private

  def end_point
    ENV['END_POINT'] || "https://boiling-tor-9383.herokuapp.com"
  end
  
  def connection
    Faraday.new(
      url: end_point,
      ssl: {verify: false}
    )do |faraday|
      faraday.request :url_encoded
      faraday.adapter Faraday.default_adapter
    end
  end
end
