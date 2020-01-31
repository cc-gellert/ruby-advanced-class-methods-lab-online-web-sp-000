class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end
  
  def initialize(name, artist_name=nil)
    @name = name 
    @artist_name = artist_name 
  end 

  def save
    self.class.all << self  
  end
  
  def self.create
    new_song = Song.new(name, artist_name=nil)
    new_song.save
    new_song 
  end 
  
  def self.new_by_name(name)
    new_song = Song.new(name, artist_name=nil)
    new_song 
  end 
  
  def self.create_by_name(name)
    new_song = Song.new(name, artist_name=nil)
    new_song.save 
    new_song 
  end 
  
  def self.find_by_name(name)
    @@all.detect {|song| song == name} 
  end 
  
  def self.find_or_create_by_name(name)
    self.find_by_name(name)
    self.create_by_name(name) 
  end 

  def self.alphabetical
    @@all.sort_by {|song| song.name}
  end 
  
  def self.new_from_filename(name)
    splits = name.split(" - ")
    artist_name = splits[0]
    namesplit = splits[1].split(".")
    name = namesplit[0]
    new_song = Song.new(name, artist_name)
    new_song 
  end 
  
  def self.create_from_filename(name)
  end 
  
  def self.destroy_all
    self.all.clear 
  end 
end
