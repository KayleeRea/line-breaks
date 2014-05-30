class LineBreaker
  #pass the method the input text and the max number
  #look for a space at index #20
  #if index #20 is a letter, work back until a space is found
  #replace that space with a new line
  #repeat through the rest of the string

  def initialize(max_length)
    @max_length = max_length
  end


  def split_lines(text)
    text.split("\n").map { |line|
      split_line(line)
    }.join("\n")
  end

  def split_line(line)
    result = ''
    length = 0
    words = line.split(/\s+/)
    words.each do |word|
      length += word.length + 1
      if length <= @max_length + 1
        result << "#{word} "
      else
        result[result.length - 1]= "\n"
        length = word.length + 1
        result << "#{word} "
      end
    end
    result.rstrip
  end

end