class TankService
  def heights
    heights_stream = ActiveSupport::JSON.decode(connection.get.body)
    heights_stream["heights"]
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
