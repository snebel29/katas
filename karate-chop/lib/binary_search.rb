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

      puts "middle_point #{middle_point} mid_value #{mid_value}"
      if mid_value == item
        index = middle_point
      end

      break if middle_point == length

      if mid_value > item
        upper_bound = middle_point - 1
        puts "upper_bound #{upper_bound}"
      end

      if mid_value < item
        puts "#{mid_value} < #{item}"
        lower_bound = middle_point + 1
        puts "lower_bound #{lower_bound}"
      end

    end

    if !index.nil?
      until self[index-1] != item || index < 1
        index -= 1
      end
    end

    return index

  end
end
