require "bundler"
Bundler.require

require "./lib/player.rb"

puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' !      |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Veuillez saisir votre nom :"
name_h = gets.chomp
player_h = HumanPlayer.new(name_h)

player1 = Player.new("Josiane")
player2 = Player.new("José")
enemies = [player1, player2]

while player_h.life_points > 0 && (player1.life_points > 0 || player2.life_points > 0)
  puts "\nVoici l'état de santé de notre champion :"
  puts player_h.show_state

  puts "\nQuelle action veux-tu effectuer ?"
  puts "\na - chercher une meilleure arme"
  puts "s - chercher à se soigner"
  puts "\nattaquer un joueur en vue :"
  puts "0 - #{player1.name} a #{player1.life_points} points de vie"
  puts "1 - #{player2.name} a #{player2.life_points} points de vie"

  choix_h = gets.chomp

  case choix_h
  when "a"
    player_h.search_weapon
  when "s"
    puts player_h.search_health_pack
    puts player_h.show_state
  when "0"
    player_h.attacks(player1)
  when "1"
    player_h.attacks(player2)
  end

  puts "\nLes autres joueurs t'attaquent !"

  enemies.each do |enemy|
    if enemy.life_points > 0
      enemy.attacks(player_h)
    end
  end
end

puts "\nLa partie est finie"
if player_h.life_points > 0
  puts "\nBRAVO ! TU AS GAGNE !"
else
  puts "\nLoser ! Tu as perdu !"
end
#binding.pry
