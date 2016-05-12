class Array
  def binary_search(item)

    lower_bound = 0
    upper_bound = length
    index = nil

    return nil if empty?

    while lower_bound <= upper_bound || !index.nil?

      middle_point = (lower_bound + upper_bound) / 2
      mid_value = self[middle_point]

      return middle_point if mid_value == item
      upper_bound = middle_point - 1 if mid_value > item
      lower_bound = middle_point + 1 if mid_value < item

    end
    return index

  end
end
