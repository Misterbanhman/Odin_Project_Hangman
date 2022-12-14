class Player
  attr_accessor :choice_array, :picked_array

  def initialize(secret_word)
    @choice_array = [].fill("-", 0, secret_word.length)
    @picked_array = []
  end    

  def print_player()
    p @choice_array
  end

  def display_player_choice(player_choice, secret_word)
    #Add the letter to the chosen array
    @picked_array.push(player_choice)

    secret_word_array = secret_word.split('')
    puts secret_word_array.length
    for i in 0..(secret_word_array.length)
        if secret_word_array[i] == player_choice
            @choice_array[i] = player_choice
        end
    end
  end
end