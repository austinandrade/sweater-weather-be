class Book
  attr_reader :destination,
              :id
  def initialize(data, current_weather, limit, destination)
    @id                = nil
    @limit = limit
    @data              = data
    @destination       = destination
    @current_weather   = current_weather
    @forecast          = forecast
    @total_books_found = total_books_found
    @books             = books
  end

  def forecast
    {
      summary:     @current_weather[:conditions],
      temperature: format_temperature(@current_weather[:temperature])
    }
  end

  def books
    data = @data[:docs].take(@limit.to_i)
    data.map do |book|
      {
        isbn:      book[:isbn],
        title:     book[:title],
        publisher: book[:publisher]
      }
    end
  end

  def total_books_found
    @data[:numFound]
  end

  def format_temperature(temperature)
    temperature.round.to_s + ' F'
  end
end
