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



    def display(choice)
        choice.each do |letter|
        end
    end

    def print()
        @secret_word.choose_word
        p @secret_word.choice
        puts @secret_word.choice.length
    end

    def check_word()
        player_choice = gets.chomp
        @player.display_player_choice(player_choice, @secret_word.choice)
        p @player.choice_array
    end

    def check_win()
        if @player.choice_array.any?("-") == true
            return false
        else
            return true
        end
    end
end

test1 = Game.new
while test1.check_win() == false
    test1.check_word
end

# @player.display_player_choice("e", "hello")