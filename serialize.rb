module Serialize

    def load_game()
        if File.exist?('./saved_games')
            puts "Saved files: #{Dir.children('./saved_games').join('')}"
            puts "Enter one of the file names in the format: 'filename.yaml'"
            filename = gets.chomp
            from_yaml(filename)
        else
            puts "There are no files to load you must play a new game!"
            new_game
        end
    end

    def to_yaml(filename)
        Dir.mkdir('saved_games') unless File.exists?('saved_games')
        f = File.open("./saved_games/#{filename}.yml", 'w')
        YAML.dump({
            :secret_word_choice => @secret_word.choice,
            :guesses => @player.guesses,
            :player_guess_history => @player.picked_array,
            :player_current_array => @player.choice_array
        }, f)
        f.close
        puts "\n GAME SAVED"
    end

    def from_yaml(filename)
        f = YAML.load(File.read("./saved_games/#{filename}"))
        @secret_word.choice = f[:secret_word_choice]
        @player.guesses = f[:guesses]
        @player.picked_array = f[:player_guess_history]
        @player.choice_array = f[:player_current_array]
    end


end