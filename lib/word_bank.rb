class WordBank
  def initialize
    @list_word = %w(book bread bike car house table)
  end

  def remove_word(word)
    @list_word -= [word]
  end

  def empty?
    @list_word.empty?
  end

  def pick_word
    if !empty?
      @list_word[rand(@list_word.length)]
    else
      nil
    end
  end

  def self.obfuscate(word)
    obs = self.shuffle(word)
    while obs == word
      obs = self.shuffle(word)
    end
    obs
  end

  def self.shuffle(word)
    word.split("").shuffle.join
  end

end