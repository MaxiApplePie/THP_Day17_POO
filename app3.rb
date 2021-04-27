require "bundler"
Bundler.require

require "./lib/player.rb"
require "./lib/game.rb"

puts "-------------------------------------------------"
puts "|Bienvenue sur 'ILS VEULENT TOUS MA POO' ! [V3] |"
puts "|Le but du jeu est d'être le dernier survivant !|"
puts "-------------------------------------------------"

puts "Veuillez saisir votre nom :"
name_h = gets.chomp

my_game = Game.new(name_h)

while my_game.is_still_ongoing?
  my_game.show_players
  my_game.menu
  choix_h = gets.chomp
  my_game.menu_choice(choix_h)
  my_game.enemies_attack
end
my_game.end
