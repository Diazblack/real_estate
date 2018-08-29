class Room
  attr_reader :category,
              :area

  def initialize(category, lenght, width)
    @category = category
    @area = lenght * width
  end

end
