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

    def from_yaml(filename)
        
    end


end