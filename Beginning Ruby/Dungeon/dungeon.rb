# DUNGEON

class Dungeon
  attr_accessor :player

  def initialize(player_name)
    @player = Player.new(player_name)
    @rooms = []
  end

  class Player
    attr_accessor :name, :location

    def initialize(player_name)
      @name = player_name
    end
  end

  class Room
    attr_accessor :reference, :name, :description, :connections

    def initialize(reference, name, description, connections)
      @reference   = reference
      @name        = name
      @description = description
      @connections = connections
    end

    def full_description
      @name + "\n\nYou are in " + @description
    end

  end

  # STRUCT je shorthand za klase koje sadrze neke vrednosti
  # Player = Struct.new(:name, :location)
  # Room = Struct.new(:reference, :name, :description, :connections)

  # Add rooms
  # dodaj obj u rooms[]
  def add_room(reference, name, description, connections)
    @rooms << Room.new(reference, name, description, connections)
  end

  # LOCATION, START
  # start pokrece igru
  def start(location)
    @player.location = location
    show_current_description
  end

  # Room.full_decription method
  def show_current_description
    puts find_room_in_dungeon(@player.location).full_description
  end

  # Trazi odgovarajucu referencu :symbol
  def find_room_in_dungeon(reference)
    # Pretrazuje rooms[]
    @rooms.detect { |room| room.reference == reference }
  end

  # Ucitava hash connections
  # npr za :largecave >> :west = :smallcave
  def find_room_in_direction(direction)
    find_room_in_dungeon(@player.location).connections[direction]
  end

  # Movement
  # pomera igraca u odgovarajucem pravcu
  # updatuje location
  def go(direction)
    puts "You go " + direction.to_s
    @player.location = find_room_in_direction(direction)
    show_current_description
  end

end # EO DUNGEON



# TEST
dungeon = Dungeon.new("Spleen Ideal")
puts "Player who entered the dungeon: " + dungeon.player.name

# ROOMS
dungeon.add_room(:largecave, "Large cave", " a large cavernous cave", { :west => :smallcave })
dungeon.add_room(:smallcave, "Small cave", " a small, claustrophobic cave", { :east => :largecave })

# START GAME
dungeon.start(:largecave)
dungeon.go(:west)
dungeon.go(:east)

