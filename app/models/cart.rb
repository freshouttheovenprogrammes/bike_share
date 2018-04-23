class Cart
  attr_reader :contents

  def initialize(initial_contents)
    @contents = initial_contents || Hash.new(0)
  end

  def total_count
    contents.values.sum
  end

  def add_item(id)
    contents[id.to_s] = contents[id.to_s].to_i + 1
  end

  def remove_item(id)
    contents.delete(id)
    contents[id.to_s] = contents[id.to_s].to_i - 1
  end

  def count_of(id)
    contents[id.to_s].to_i
  end

  def total_sum
    contents.keys.reduce(0) do |memo, item_id|
      memo += Item.where(id: item_id).first.price
    end
  end

end
