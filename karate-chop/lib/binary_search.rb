class Array
  def binary_search(item)

    return nil if empty?

    sort!
    lower_bound = 0
    upper_bound = length
    index = nil

    while lower_bound <= upper_bound && index.nil?

      middle_point = (lower_bound + upper_bound) / 2
      mid_value = self[middle_point]

      index = middle_point if mid_value == item

      break if middle_point == length
      upper_bound = middle_point - 1 if mid_value > item
      lower_bound = middle_point + 1 if mid_value < item
      
    end

    if !index.nil?
      until self[index-1] != item || index < 1
        index -= 1
      end
    end

    return index

  end
end
