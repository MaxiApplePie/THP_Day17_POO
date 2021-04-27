class Game
  attr_accessor :player_h
  attr_accessor :enemies

  def initialize(player_name)
    @player_h = HumanPlayer.new(player_name)
    # clear@player4 = Player.new("Toto")
    # @enemies = [@player1, @player2, @player3, @player4]
    @enemies = [Player.new("Josiane"), Player.new("José"), Player.new("Corinne"), Player.new("Toto")]
  end

  def kill_player(player)
    enemies.delete(player)
  end

  def is_still_ongoing?
    return (player_h.life_points > 0 and enemies.size > 0)
  end

  def show_players
    puts "\nVoici l'état de santé de notre champion :"
    puts player_h.show_state
    puts "\nIl reste #{enemies.size} enemis"
  end

  def menu
    puts "\nQuelle action veux-tu effectuer ?"
    puts "\na - chercher une meilleure arme"
    puts "s - chercher à se soigner"
    puts "\nattaquer un joueur en vue :"
    for i in 0...enemies.size
      puts "#{i} - #{enemies[i].name} a #{enemies[i].life_points} points de vie"
    end
    # OLD /// puts "0 - #{@enemies[0].name} a #{@enemies[0].life_points} points de vie"
    print ">>> "
  end

  def menu_choice(choix_h)
    case choix_h
    when "a"
      player_h.search_weapon
    when "s"
      puts player_h.search_health_pack
      puts player_h.show_state
    else
      choix_i = choix_h.to_i
      if choix_i < enemies.size
        player_h.attacks(enemies[choix_i])
        if (enemies[choix_i].life_points <= 0) then kill_player(enemies[choix_i]) end
      end
      # OLD /// when "2"
      # OLD ///   @player_h.attacks(@enemies[2])
      # OLD ///   if (@enemies[2].life_points <= 0) then kill_player(@enemies[2]) end
    end
  end

  def enemies_attack
    puts "\nLes autres joueurs t'attaquent !"

    enemies.each do |enemy| # ICI
      if enemy.life_points > 0
        enemy.attacks(player_h)
      end
    end
  end

  def end
    puts "\nLa partie est finie"
    if player_h.life_points > 0
      puts "\nBRAVO ! TU AS GAGNE !"
    else
      puts "\nLoser ! Tu as perdu !"
    end
  end

  def is_integer?
    self.to_i == self
  end

  def show_game #Methode perso de verfiication
    return enemies
  end
end
