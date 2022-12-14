require 'yaml'
require './player'
require './secretword'
# require './serialize'

class Game
    # include Serialize 

    attr_accessor :player, :secret_word

    def initialize()
        @secret_word = SecretWord.new
        @secret_word.choose_word
        @player = Player.new(@secret_word.choice)
    end

    def print()
        @secret_word.choose_word
        p @secret_word.choice
        puts @secret_word.choice.length
    end

    def check_word()
        #Prompts the user for a guess.
        puts "Please input a letter that you would like to guess!"
        player_choice = gets.chomp.downcase
        puts "------------------------------------------"

        if (('a'..'z').to_a).include?(player_choice) == true && (@player.picked_array).include?(player_choice) == false
            @player.display_player_choice(player_choice.to_s, @secret_word.choice)
            p @player.choice_array
            @player.decrement_guess
            puts "\nYou still have #{@player.guesses} guesses!"
            puts "And you have already guessed these letters: #{player.picked_array}"
            puts "------------------------------------------"
        else
            puts "You have inputted an incorrect value that is not a letter. Please try again!"
            puts "\n"
            check_word
        end
    end

    def check_win()
        if @player.choice_array.any?("-") == true
            if @player.guesses > 0 
              return false
            else
              puts "You have run out of guesses!"
              exit
            end
        else
            return true
        end
    end
end

test1 = Game.new
while test1.check_win() == false
    test1.check_word
end

puts "Congratulations! You have guessed the word correctly!"