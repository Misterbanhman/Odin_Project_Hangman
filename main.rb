require 'yaml'
require './player'
require './secretword'
require './serialize'

class Game
    include Serialize 

    attr_accessor :player, :secret_word

    def initialize()
        @secret_word = SecretWord.new
        @secret_word.choose_word
        @player = Player.new(@secret_word.choice)
        new_game
    end

    def new_game()
        puts "Enter '1' for new game or '2' to load a saved game!"
        input = gets.chomp

        if input == "1"
            while check_win() == false
                check_word
            end
            
            puts "Congratulations! You have guessed the word correctly!"
        elsif input == "2"
            load_game
            new_game
        else
            puts "The value you entered is neither '1' nor '2'. Please try again!"
            new_game
        end
    end

    def check_word()
        #Prompts the user for a guess.
        puts "Please input a letter that you would like to guess!"
        puts "If you would like to save the game state, please enter in 'save'"
        player_choice = gets.chomp.downcase
        puts "------------------------------------------"

        if (('a'..'z').to_a).include?(player_choice) == true && (@player.picked_array).include?(player_choice) == false
            @player.display_player_choice(player_choice.to_s, @secret_word.choice)
            p @player.choice_array
            @player.decrement_guess
            puts "\nYou still have #{@player.guesses} guesses!"
            puts "And you have already guessed these letters: #{player.picked_array}"
            puts "------------------------------------------"

        elsif player_choice == 'save'
            puts "Please input the name of the file you would like to save!"
            filename = gets.chomp
            to_yaml(filename)
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
              puts "The secret word was '#{@secret_word.choice.upcase}'"
              exit
            end
        else
            return true
        end
    end
end

Game.new