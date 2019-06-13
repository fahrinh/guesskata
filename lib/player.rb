class Player
  attr_accessor :name, :score

  def initialize(name, score = 0)
    @name = name
    @score = score
  end

  def inc_score
    @score += 1
  end
end