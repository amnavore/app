require 'test_helper'

class RestaurantTest < ActiveSupport::TestCase
  setup do
    @res = restaurants(:chinese)
  end
  test "Cannot add a restaurant without a name" do
    invalid = Restaurant.create(cost: @res.cost, mood_names: @res.mood_names)
    assert_not invalid.valid?
    valid = invalid
    valid.name = @res.name
    assert valid.valid?
  end
  test "Cannot add a restaurant with invalid costs" do
    invalid = Restaurant.create(name: @res.name, mood_names: @res.mood_names)
    assert_not invalid.valid?
    invalid.cost = 8
    assert_not invalid.valid?
    invalid.cost = -2
    assert_not invalid.valid?
    valid = invalid
    valid.cost = @res.cost
    assert valid.valid?
  end
  test "Mood names returns in the same format that it is added in" do
    moods = Restaurant.create(name: @res.name, cost: @res.cost, mood_names: @res.mood_names)
    assert_equal moods.mood_names, @res.mood_names
  end
end
