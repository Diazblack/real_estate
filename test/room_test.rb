require 'minitest/autorun'
require 'minitest/pride'
require './lib/room.rb'

class RoomTest < Minitest::Test
  def test_if_exist
    room = Room.new(:bedroom, 10, 13)

    assert_instance_of Room, room
  end

  def test_if_it_has_attributes
    room = Room.new(:bedroom, 10, 13)

    assert_equal :bedroom, room.category
    assert_equal 130, room.area
  end
end
