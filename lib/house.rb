class House
  attr_reader :price,
              :address,
              :rooms

  def initialize(price, address)
    @price = price
    @address = address
    @rooms = []
  end

  def add_room(room)
    @rooms << room
  end

  def rooms_from_category(space)
    @rooms.select do |room|
      if room.category == space
        room
     end
    end
  end

  def area
    house_area = 0
    @rooms.each do |room|
      house_area += room.area
    end
    house_area
  end

  def price_per_square_foot
    large = @price.length
    number = @price[1..large].to_f
    (number / self.area).round(2)
  end

  def rooms_sorted_by_area
    @rooms.sort_by do |room|
      room.area
    end.reverse
  end

  def rooms_sorted_by_category
    sorted_by_category ={}
    @rooms.each do |cate|
      sorted_by_category[cate.category] = rooms_from_category(cate.category)
    end
    sorted_by_category
  end
end
