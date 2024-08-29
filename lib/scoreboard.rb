class Scoreboard
  def self.display(player1, player2)
    IOHandler.output("P1: #{player1.lives}/3 vs P2: #{player2.lives}/3")
  end
end
