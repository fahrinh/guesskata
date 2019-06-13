class Level
  def initialize
    @level = {
        easy: %w(book bread bike car house table),
        medium: %w(handkerchief rhythm xyster qintar coz),
        hard: %w(anachronistic recalcitrant iconoclast embezzlement vituperate)
    }
  end

  def levels
    @level
  end
end