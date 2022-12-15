class Player
  attr_accessor :choice_array, :picked_array, :guesses

  def initialize(secret_word)
    @choice_array = [].fill("-", 0, secret_word.length)
    @picked_array = []
    @guesses = 10
  end    

  def display_player_choice(player_choice, secret_word)
    #Add the letter to the chosen array
    @picked_array.push(player_choice)

    secret_word_array = secret_word.split('')
    for i in 0..(secret_word_array.length)
        if secret_word_array[i] == player_choice
            @choice_array[i] = player_choice
        end
    end
  end

  def decrement_guess
    @guesses -= 1
  end

end