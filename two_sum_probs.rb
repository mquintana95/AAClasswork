def bad_two_sum?(arr, target_sum)
    arr.each_with_index do |num1,i|
        arr.each_with_index do |num2,j|
            if j > i && num1 + num2 == target_sum
                return true
            end
        end
    end
    false
end

arr = [0, 1, 5, 7]
# p bad_two_sum?(arr, 6) # => should be true
# p bad_two_sum?(arr, 10) # => should be false

def okay_two_sum?(arr,target_sum)
    arr = arr.sort
    i = 0
    j = arr.length - 1
    while i < j
        case(arr[i] + arr[j]) <=> target_sum
        when 0
           return true 
        when -1
            i += 1
        when 1 
            j -= 1
        end
    end
    false
end
okay_two_sum?(arr, 6) # => should be true
okay_two_sum?(arr, 10) # => should be false

def two_sum?(arr,target_sum)
    Hash.new(0)

    arr.each do |ele|
        return true if (target_sum-ele)
    end
    false
end




    