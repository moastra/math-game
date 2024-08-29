class Game
  def initialize
    @player1 = Player.new("Player 1")
    @player2 = Player.new("Player 2")
    @current_player = @player1 
  end

  def generate_question
    question = Question.new
    player_answer = IOHandler.get_input("#{@current_player.name}: #{question.prompt}").to_i

    if question.correct_answer?(player_answer)
      IOHandler.output("#{@current_player.name}: YES! You are correct!")
    else
      IOHandler.output("#{@current_player.name}: Seriously? No!")
      @current_player.lose_life
    end
  end

  def display_scores
    Scoreboard.display(@player1, @player2)
  end

  def switch_turn
    @current_player = @current_player == @player1 ? @player2 : @player1
    IOHandler.output("----- NEW TURN -----")
  end
  
  def game_over?
    !@player1.alive? || !@player2.alive?
  end

  def winner
    @player1.alive? ? @player1 : @player2
  end

  def play
    until game_over?
      generate_question
      display_scores
      switch_turn
    end

    IOHandler.output("#{winner.name} wins with a score of #{winner.lives}/3")
    IOHandler.output("----- GAME OVER -----")
    IOHandler.output("Good bye!")
  end
end
