class BackgroundsService
  class << self
    def get_photo_data(location)
      response = conn.get("/search/photos?query=#{location}")
      parse_data(response)
    end

    private

    def conn
     Faraday.new(url: 'https://api.unsplash.com') do |faraday|
       faraday.params['client_id'] = ENV['us']
       faraday.params['per_page'] = 1
       faraday.params['order_by'] = 'relevant'
     end
   end

   def parse_data(response)
     JSON.parse(response.body, symbolize_names: true)
   end
  end
end
