class Node
	attr_reader :data
	attr_accessor :left, :right
	
	def initialize data
		@data = data
	end
end

def array_to_tree(array, index = 0)
  if index >= array.size
    return nil
  end
  root = Node.new(array[index])
  root.left = array_to_tree(array, 2 * index + 1)
  root.right = array_to_tree(array, 2 * index + 2)
  root
end


def search_tree?(array)
	root = array_to_tree(array)
  def search_tree_rec?(root)
    if root != nil
      if (root.left != nil && root.left.data >= root.data) || (root.right != nil && root.right.data <= root.data)
        return false
      else
        return search_tree_rec?(root.left) && search_tree_rec?(root.right)
      end
    else
      return true
    end
  end
  search_tree_rec?(root)
end

puts search_tree?([10, 4, 12])
# => true

puts search_tree?([10, 5, 7])
# => false
