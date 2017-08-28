dictio = %w(below down go going horn how howdy it i low own part partner sit)

def substrings(string, dict)
  string_pairs = {}
  string_split = string.downcase.split

  string_split.each do |word|
    dict.each do |wordz|
      if word.include? wordz
        string_pairs[wordz] = 0
        string_pairs[wordz] += 1
      end
    end
  end
  string_pairs
end

p substrings("Howdy partner, sit down! How's it going?", dictio)
