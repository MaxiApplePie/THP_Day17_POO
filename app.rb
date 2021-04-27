require "pry"
require "./lib/player.rb"

player1 = Player.new("José")
player2 = Player.new("Hector")

while (player1.life_points > 0 and player2.life_points > 0)
  puts "\nVoici l'état de nos joueurs :"
  puts player1.show_state
  puts player2.show_state

  puts "\nFight ! Passons à la phase d'attaque"

  player1.attacks(player2)
  if (player2.life_points <= 0)
    break
  end
  player2.attacks(player1)
end
#binding.pry
