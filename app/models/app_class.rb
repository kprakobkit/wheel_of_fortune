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





