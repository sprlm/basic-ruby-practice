def substrings(string, dictionary)
  string = string.downcase
  substring_count = Hash.new

  dictionary.each do |word|
    substring_count[word] = string.scan(word).length if string.include?(word)
  end

  p substring_count
end

dictionary = ["below","down","go","going","horn","how","howdy","it","i","low","own","part","partner","sit"]

substrings("Howdy partner, sit down! How's it going?", dictionary)
