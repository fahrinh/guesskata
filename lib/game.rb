require 'tty-prompt'

require 'player'
require 'word_bank'
require 'level'

class Game

  def play
    prompt = TTY::Prompt.new

    name = prompt.ask("What's your username?", required: true)
    player = Player.new(name)

    puts "Hello #{player.name}, let's play !"

    Level.new.levels.each do |level, list_word|
      word_bank = WordBank.new(list_word)

      while true
        if word_bank.empty?
          break
        end

        word = word_bank.pick_word
        obs_word = WordBank.obfuscate(word)

        prompt.ask("[#{level.capitalize}] Guess this word: #{obs_word} >>> ") do |q|
          q.validate(/\A#{word}\z/i, "WRONG. Try again. Guess this word: #{obs_word}")
        end

        player.inc_score
        word_bank.remove_word(word)

        puts "RIGHT. Your score: #{player.score}"
      end
    end

    puts "Congratulation #{player.name}! You've solved all words with score: #{player.score}"

  end

end