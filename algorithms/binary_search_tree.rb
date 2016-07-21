class BinarySeachTree

	attr_reader data, left, right
  
  def initialize(data)
  	@data = data
  end

  def insert(child_data)
    child_data < data ? _insert_left(data) : _insert_right(data)
  end

  private

  def _insert_left(child_data)
  	if left.nil?
  		left = BinarySeachTree.new(data)
  	else
  		left.insert(child_data)
  	end
  end

  def _insert_right(child_data)
  	if right.nil?
  		right = BinarySeachTree.new(data)
  	else
  		right.insert(child_data)
  	end
  end

end

[11, 6, 8, 19, 4, 10, 5, 17, 43, 49, 31]
