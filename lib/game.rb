require 'tty-prompt'

require 'player'
require 'word_bank'

class Game

  def play
    prompt = TTY::Prompt.new

    name = prompt.ask "What's your username?"
    player = Player.new(name)

    puts "Hello #{player.name}, let's play !"

    word_bank = WordBank.new

    while true
      if word_bank.empty?
        puts "Congratulation #{player.name}! You've solved all words with score: #{player.score}"
        break
      end

      word = word_bank.pick_word()
      obs_word = WordBank.obfuscate(word)

      answer = prompt.ask("Guess this word: #{obs_word} >>> ") do |q|
        q.validate(/\A#{word}\z/i, "WRONG. Try again. Guess this word: #{obs_word}")
        # q.messages[:validate?] =
      end

      player.inc_score
      word_bank.remove_word(word)

      puts "RIGHT. Your score: #{player.score}"
    end

  end

end