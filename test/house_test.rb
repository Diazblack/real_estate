require 'minitest/autorun'
require 'minitest/pride'
require './lib/room'
require './lib/house.rb'
require 'pry'

class HouseTest < Minitest::Test
  def test_if_exist
    house = House.new("$400000", "123 sugar lane")

    assert_instance_of House, house
  end

  def test_if_it_has_attributes
    house = House.new("$400000", "123 sugar lane")

    assert_equal "$400000", house.price
    assert_equal "123 sugar lane", house.address
    assert_equal [], house.rooms
  end

  def test_if_it_can_add_rooms
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)

    assert_equal [room_1], house.add_room(room_1)

    room_2 = Room.new(:bedroom, 11, 15)

    assert_equal [room_1,room_2], house.add_room(room_2)
  end

  def test_if_it_can_get_rooms_array
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)

    house.add_room(room_1)
    house.add_room(room_2)

    assert_equal [room_1,room_2], house.rooms
  end

  def test_if_it_can_get_rooms_by_category
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal [room_1,room_2],
    house.rooms_from_category(:bedroom)

    assert_equal [room_4],
    house.rooms_from_category(:basement)
  end

  def test_if_it_can_get_area_of_the_house
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 1900, house.area
  end

  def test_if_it_can_get_the_price_per_square_foot
    house = House.new("$400000", "123 sugar lane")
    room_1 = Room.new(:bedroom, 10, 13)
    room_2 = Room.new(:bedroom, 11, 15)
    room_3 = Room.new(:living_room, 25, 15)
    room_4 = Room.new(:basement, 30, 41)

    house.add_room(room_1)
    house.add_room(room_2)
    house.add_room(room_3)
    house.add_room(room_4)

    assert_equal 210.53,
    house.price_per_square_foot
  end
end
