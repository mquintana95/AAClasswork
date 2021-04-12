def my_min(list)
    smallest = list[0]
    list.each do |num1|
        smallest = num1 if num1 < smallest
        # list.each do |num2|
        #     if smallest > num2
        #         smallest = num2
        #     end 
        # end
    end
    smallest
end



# list = [ 0, 3, 5, 4, -5, 10, 1, 90 ]
# p my_min(list) # -5


list = [5,3,-7]

def sub_sum(list)
    sums = 0
    subs =[]
    list.each_with_index do |num,i|
        sums = num if num > sums
        sum = num
        (i+1...list.length).each do |j|
           sum += list[j]
           sums = sum if sum > sums
        end
    end
    sums
end

p sub_sum(list)