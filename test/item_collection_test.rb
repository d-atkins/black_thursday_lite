require 'minitest/autorun'
require 'minitest/pride'
require './lib/item_collection'
require './lib/item'

class ItemCollectionTest < Minitest::Test
  def setup
    @item1 = Item.new({
      :id          => 1,
      :name        => "Pencil",
      :description => "You can use it to write things",
      :unit_price  => 1099,
      :merchant_id => 2
    })
    @item2 = Item.new({
      :id          => 2,
      :name        => "Pen",
      :description => "You can use it to write things",
      :unit_price  => 1199,
      :merchant_id => 2
    })
    @item3 = Item.new({
      :id          => 3,
      :name        => "Beagle",
      :description => "You can use it to be happy",
      :unit_price  => 20099,
      :merchant_id => 45
    })
    @items = [@item1, @item2, @item3]
    @item_collection = ItemCollection.new(@items)
  end

  def test_it_exists
    assert_instance_of ItemCollection, @item_collection
  end

  def test_it_returns_all_items
    assert_equal @items, @item_collection.all
  end

  def test_it_returns_all_items_of_a_merchant_id
    assert_equal [@item1, @item2], @item_collection.where(2)
    assert_equal [@item3], @item_collection.where(45)
  end
end
