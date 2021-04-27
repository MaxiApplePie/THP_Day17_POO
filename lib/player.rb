class Player
  # Classe de joueur standard
  attr_accessor :name
  attr_accessor :life_points

  def initialize(name)
    @name = name
    @life_points = 10
  end

  def gets_damage(points_recus)
    @life_points -= points_recus
    if (@life_points <= 0)
      puts "le joueur #{@name} a été tué !"
      @life_points = 0
    end
  end

  def attacks(joueur)
    puts "\nle joueur #{@name} attaque le joueur #{joueur.name}"
    damage_points = computes_damages
    joueur.gets_damage(damage_points)
    puts "il lui inflige #{damage_points} points de dommages"
  end

  def computes_damages
    return rand(1..6)
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie"
  end
end

class HumanPlayer < Player
  # Classe de joueur amélioré
  attr_accessor :weapon_level # définira, sous forme d'integer, le niveau de l'arme

  def initialize(name)
    @name = name
    @life_points = 100
    @weapon_level = 1
  end

  def show_state
    return "#{@name} a #{@life_points} points de vie et une arme de niveau #{@weapon_level}"
  end

  def computes_damages
    return rand(1..6) * @weapon_level
  end

  def search_weapon
    niveau_arme = rand(1..6)
    puts "Tu as trouvé une arme de niveau #{niveau_arme}"
    if (niveau_arme > @weapon_level)
      @weapon_level = niveau_arme
      puts "Youhou ! elle est meilleure que ton arme actuelle : tu la prends."
    else
      puts "M@*#$... elle n'est pas mieux que ton arme actuelle..."
    end
  end

  def search_health_pack
    niveau_health_pack = rand(1..6)
    case niveau_health_pack
    when 1
      return "Tu n'as rien trouvé... "
    when 2..5
      improve_health(50)
      return "Bravo, tu as trouvé un pack de +50 points de vie !"
    when 6
      improve_health(80)
      return "Waow, tu as trouvé un pack de +80 points de vie !"
    end
  end

  def improve_health(health_bonus)
    @life_points += health_bonus
    if @life_points > 100
      @life_points = 100
    end
  end
end
