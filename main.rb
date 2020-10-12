require "./players"
require "./questions"

class Game
  # Collect player info
  def initialize
    puts "Want to play a math game?"
    sleep(1)

    print "Player 1, please enter your name: "
    name1 = gets.chomp
    @player1 = Players.new(name1)

    print "Player 2, please enter your name: "
    name2 = gets.chomp
    @player2 = Players.new(name2)

    puts "#{@player1.name} and #{@player2.name}, if you're ready, let's get started!"
  end

  # Question logic
  def questions
    question = Questions.new
    @question = question.question
    @answer = question.answer

    puts "New Question"
    sleep(1)
    if @player1.turn
      puts "This question is for #{@player1.name}"
      puts "#{@question}"
    else
      puts "This question is for #{@player2.name}"
      puts "#{@question}"
    end
  end

  def answer_checker
    if STDIN.gets.chomp.to_i == @answer
      if @player1.turn
        @player1.life += 1
        puts "You got it!"
        @player1.turn = false
        @player2.turn = true
        win?
        life
      else
        @player2.life += 1
        puts "You got it!"
        @player1.turn = true
        @player2.turn = false
        win?
        life
      end
    else 
      if @player1.turn
        puts "Nope, that's not quite right!"
        @player1.life -= 1
        @player1.turn = false
        @player2.turn = true
        sleep(1)
        puts "The correct answer was #{@answer}"
        game_over?
        life
      else
        puts "Nope, that's not quite right!"
        @player2.life -= 1
        @player1.turn = true
        @player2.turn = false
        sleep(1)
        puts "The correct answer was #{@answer}"
        game_over?
        life
      end
    end
  end

  # Calculate life
  def life
    sleep(1)
    puts "Here is the score: "
    puts "#{@player1.name}: #{@player1.life.to_s}/3"
    puts "#{@player2.name}: #{@player2.life.to_s}/3"
  end

  # Which turn?
  def turn
    questions
    answer_checker
  end

  # Game over?
  def game_over?
    if @player1.life < 0 || @player2.life < 0
      return
    end
  end

  # Winner!
  def win?
    if @player1.life == 3
      sleep(1)
      puts "Game Over!"
      sleep(1)
      puts "#{@player1.name} wins!"
      return
    elsif @player2.life == 3
      sleep(1)
      puts "Game Over!"
      sleep(1)
      puts "#{@player2.name} wins!"
      return
    else
      turn
    end
  end
end

game = Game.new
game.turn