require 'tty-prompt'

require 'player'

class Game

  def play
    prompt = TTY::Prompt.new

    name = prompt.ask "What's your username?"
    player = Player.new(name)

    puts "Hello #{player.name}, let's play !"

    still_play = true
    list_word = ['book', 'bread', 'bike', 'car', 'house', 'table']

    while still_play
      if list_word.empty?
        puts "Congratulation #{player.name}! You've solved all words with score: #{player.score}"
        break
      end

      word = pick_word(list_word)
      obs_word = obsfucate(word)

      answer = prompt.ask("Guess this word: #{obs_word} >>> ") do |q|
        q.validate(/\A#{word}\z/i, "WRONG. Try again. Guess this word: #{obs_word}")
        # q.messages[:validate?] =
      end

      player.inc_score
      list_word = list_word - [word]

      puts "RIGHT. Your score: #{player.score}"
    end

  end

  def pick_word (list_word)
    if !list_word.empty?
      list_word[rand(list_word.length)]
    else
      ''
    end
  end

  def obsfucate(word)
    word.split("").shuffle.join
  end
end