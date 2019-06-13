require 'tty-prompt'

class Game

  def play
    prompt = TTY::Prompt.new

    name = prompt.ask "What's your username?"
    puts "Hello #{name}, let's play !"

    score = 0
    still_play = true
    list_word = ['book', 'bread', 'bike', 'car', 'house', 'table']

    while still_play
      if list_word.empty?
        puts "Congratulation #{name}! You've solved all words with score: #{score}"
        break
      end

      word = pick_word(list_word)
      obs_word = obsfucate(word)

      answer = prompt.ask("Guess this word: #{obs_word} >>> ") do |q|
        q.validate(/\A#{word}\z/i, "WRONG. Try again. Guess this word: #{obs_word}")
        # q.messages[:validate?] =
      end

      score += 1
      list_word = list_word - [word]

      puts "RIGHT. Your score: #{score}"
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