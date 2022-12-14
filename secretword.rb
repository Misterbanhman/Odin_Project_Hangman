class SecretWord
  attr_accessor :choice

  def initialize()
    @choice = []
  end

  def choose_word()
    word_array = []
    word_list = File.open('./google-10000-english.txt')
    word_list.each do |word|
        if word.length >= 5 && word.length <= 12
            word_array.push(word)
        end
    end
    @choice = word_array.sample.strip
  end
end