def max_windowed_range(arr, window)
  windows = arr.length - window + 1
  best_range = nil

  num_windows.times do |i|
    window = array.slice(i, window)
    curr_range = window.max - window.min

    best_range = curr_range if !best_range || curr_range > best_range
  end

  best_range
end