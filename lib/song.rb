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
    self.class.initialize(name, artist_name=nil)
    self.save  
    self 
  end 
  
  def self.new_by_name(name)
    self.class.initialize 
  end 
  
  def self.create_by_name(name)
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
    @@all
  end 
  
  def self.new_from_filename(name)
    
  end 
  
  def self.create_from_filename(name)
  end 
  
  def self.destroy_all
    self.all.clear 
  end 
end
