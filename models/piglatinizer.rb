class PigLatinizer
  attr_reader :text
  # def initialize(user_input)
  #   @text = user_input.downcase
  # end

  def piglatinize(word)

      if word[0].downcase.match(/a|e|o|u|i/)
        word <<"way"
      elsif word.end_with?("ay")
        word = "ay" + word
      elsif word[0] !~ /a|e|o|u|i/ && word[1] !~ /a|e|o|u|i/ && word[2] !~ /a|e|o|u|i/
        moved_letter = word[0]
        moved_letter << word[1]
        moved_letter << word[2]
        moved_letter << "ay"
        word = word[3..-1]
        word << moved_letter
      elsif word[0] !~ /a|e|o|u|i/ && word[1] !~ /a|e|o|u|i/ 
        moved_letter = word[0]
        moved_letter << word[1]
        word = word[2..-1]
        moved_letter << "ay"
        word << moved_letter        
      else
        moved_letter = word[0]
        moved_letter << "ay"
        word = word[1..-1]
        word << moved_letter
      end
    word
  end

  def to_pig_latin(word)
    sentence = word.split(" ")
    sentence.collect! do |word|
      piglatinize(word)
    end
    word = sentence.join(" ")
  end
end