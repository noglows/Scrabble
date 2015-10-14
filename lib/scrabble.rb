require 'pry'

class Scrabble
  attr_accessor :player_words, :score
  def initialize

  end

  def self.score(word)
    if word.class != String
        raise ArgumentError, "Input must be a string."
    else
      word.length.times do |letter|
        if !("a".."z").to_a.include? word[letter]
            raise ArgumentError, "Input must be an alphabetical string."
        end
      end
    end

    @score = 0
    if word.length == 7
      @score += 50
    end
    word.length.times do |index|
      case word[index].upcase
      when "A","E","I","O","U","L","N","R","S","T"
        @score += 1
      when "D","G"
        @score += 2
      when "B","C","M","P"
        @score += 3
      when "F","H","V","W","Y"
        @score += 4
      when "K"
        @score += 5
      when "J", "X"
        @score += 8
      when "Q", "Z"
        @score += 10
      end
    end
    return @score
      #word[index]
  end

  def self.highest_score_from(array_of_words)
    sorted_array = array_of_words.sort_by {|word| score(word)}

    at_max = true
    highest_scored_words = []
    index = 0

    while at_max == true
      index -= 1
      if index.abs >= sorted_array.length
        if score(sorted_array[index]) == score(sorted_array[index+1])
          highest_scored_words.push(sorted_array[index])
          at_max = false
        end
      else
        highest_scored_words.push(sorted_array[index])
        if score(sorted_array[index]) > score(sorted_array[index-1])
          at_max = false
        end
      end
    end
    highest_scored_words.sort_by! {|word| word.length}


    highest_scored_words.each do |word|
      #puts "made it here"
      if word == highest_scored_words[-1]
        return word
      end
      word_index = highest_scored_words.index(word)
      if word.length < highest_scored_words[word_index+1].length
        #binding.pry
        return word
      end
    end


  end

    #return highest_scored_words[0]
end
