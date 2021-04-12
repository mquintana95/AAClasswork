def first_anagram?(str1,str2)
    anagrams(str1).include?(str2)
end

def anagrams(word)
    return [word] if word.length <= 1
    old_anagrams = anagrams(word[0...-1])
    new_anagrams = []
    old_anagrams.each do |gram|
        (0..gram.length).each do |i|
            new_anagrams << gram.dup.insert(i, word[-1])
        end
    end
    return new_anagrams
end

first_anagram?('cat','act')

def second_anagram?(str1, str2)
    arr1 = str1.split("")
    arr2 = str2.split("")

    arr1.each do |char|
        target = arr2.find_index(char)
        return false if !target
        arr2.delete_at(target)
    end
    arr2.empty?
end

def third_anagram?(str1, str2)
    split1 = str1.split("")
    split2 = str2.split("")
    split1.sort.join == split2.sort.join
end

def fourth_anagram?(str1, str2)
    count1 = Hash.new(0)
    count2 = Hash.new(0)

    str1.each_char { |char| count1[char] += 1 }
    str2.each_char { |char| count2[char] += 1 }

    count1 == count2
end



