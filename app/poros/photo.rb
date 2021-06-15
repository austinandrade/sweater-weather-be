class Photo
  attr_reader :id

  def initialize(data, location)
    @id = nil
    @data = data
    @location = location
    @image = image
  end

  def image
    {
      location: @location,
      image_url: @data[:results][0][:urls][:raw],
      credit:
      {
        source: 'https://unsplash.com',
        photographer: @data[:results][0][:tags][0][:source][:cover_photo][:user][:name],
        photographer_profile: @data[:results][0][:tags][0][:source][:cover_photo][:user][:links][:html]
      }
    }
  end
end
