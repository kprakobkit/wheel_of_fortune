class Letter
  attr_reader :letter
  attr_accessor :hidden

  def initialize(letter, position)
    @letter = letter
    @position = position
    @hidden = false
  end
end

# Other methods
def convert_string_to_objects(string)
  list_of_letter = []

  string.split("").each_with_index do |letter, index|
    list_of_letter << Letter.new(letter, index)
  end

  list_of_letter
end

def hide_phrase(phrase)
  list_of_letter = convert_string_to_objects(phrase)
  letters_to_hide = phrase.split("").sample(phrase.length*0.5)
  exceptions =[" ", ",", ".", "?", "!", ";", ":"]
  list_of_letter.each do |letter|
    if exceptions.include?(letter.letter)
      next
    elsif letters_to_hide.include?(letter.letter)
      letter.hidden = true
    else
      letter.hidden = false
    end
  end

  list_of_letter
end

def show_hidden_phrase(phrase_with_hidden_letters)
  phrase_with_hidden_letters.each do |letter|
    if letter.hidden == true
      print "_"
    else
      print "#{letter.letter}"
    end
  end
  puts
end

def done?(hidden_phrase, number_of_wrong)

  if number_of_wrong > 4
    puts "you lose"
    return true
  end

  hidden_phrase.each do |letter|
    if letter.hidden == true
      return false
    end
  end
  puts "you win!"
  true
end
# run program
def play
  puts "Welcome to Hangman!!!!!"
  puts
  # pick_a_category # pick category

  puts "Here is your phrase. Guess away..."

  answer_phrase = "peter is so beautiful to me"
  hidden_phrase = hide_phrase(answer_phrase)
  show_hidden_phrase(hidden_phrase)
  letters_tried = []

  number_of_wrong = 0
  score = 0

  until done?(hidden_phrase, number_of_wrong)
    found_letter = false
    puts "\e[H\e[2J"
    score_multiplier = rand(1..100)
    puts "Your score is: #{score}."
    puts "Your multiplier for this round is #{score_multiplier}"
    show_hidden_phrase(hidden_phrase)
    puts "You've tried: #{letters_tried.join(" ")}"
    puts number_of_wrong
    puts "please guess one letter:"
    print "> "
    users_guess = gets.chomp.downcase
    letters_tried << users_guess

    hidden_phrase.each do |letter|
      if letter.letter == users_guess
        letter.hidden = false
        
        found_letter = true
      end
    end

    if found_letter
      score += answer_phrase.count(users_guess) * score_multiplier
    end

    if !found_letter
      number_of_wrong += 1
      score -= score_multiplier
    end
  end
  puts "answer: " + answer_phrase
  puts "Your final score: #{score}"
end

play






