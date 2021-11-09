class Player
  attr_accessor :livesLeft, :name

  def initialize(livesLeft, name)
    @livesLeft = livesLeft
    @name = name
  end
end

class Game
  def start(p1, p2)
    currentPlayerIndex = 0
    players = [p1, p2]

    while p1.livesLeft > 0 && p2.livesLeft > 0
      puts "----- NEW TURN -----"
      print "#{players[currentPlayerIndex].name}: "
      if askQuestion == true
        puts "YES! You are correct."
      else
        puts "Seriously? No!"
        players[currentPlayerIndex].livesLeft -= 1
      end

      printScores(players[0].livesLeft, players[1].livesLeft)
      currentPlayerIndex = ((currentPlayerIndex + 1) % 2)
    end
    
    if p1.livesLeft != 0
      puts "Player 1 wins with a score of #{p1.livesLeft}/3"
    else
      puts "Player 2 wins with a score of #{p2.livesLeft}/3"
    end
    puts "----- GAME OVER -----"
    puts "Good bye!"
  end

  def askQuestion
    r1 = rand(1..20)
    r2 = rand(1..20)
    puts "What does #{r1} plus #{r2} equal?"
    print "> "
    choice = $stdin.gets.chomp.to_i
    if choice == (r1 + r2)
      return true
    else
      return false
    end
  end

  def printScores(p1Lives, p2Lives)
    puts "P1: #{p1Lives}/3 vs P2: #{p2Lives}/3"
  end
end

p1 = Player.new(3, "Player 1")
p2 = Player.new(3, "Player 2")
g = Game.new
g.start(p1, p2)