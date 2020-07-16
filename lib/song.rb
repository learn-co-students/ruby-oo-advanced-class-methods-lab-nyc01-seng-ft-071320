require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []

  def self.all
    @@all
  end

  def save
    self.class.all << self
  end

  def self.create #need to instantiate, so used self to instantiate
    song=self.new # self method to create an instance of song 
    #and store in method variable song
    @@all<<song # after song is created, we put song in all
    song #function needs to return song
    # binding.pry
  end

  def self.new_by_name (name) #instantiates, so self?
    song=self.new #create an intance of song using a self method
    song.name=name #using the name accessor, we are assigning a name to the song
    song
  end

  def self.create_by_name (name) #instantiates, need self? 
    song=self.new #song instatnate using the self method (now song)
    song.name=name #using the method of name to assign a name to it
    @@all<<song #throwing the song into the instance variable @all
    song
  end

  def self.find_by_name (name) #still not sure how to use self
    @@all.find{|song|song.name==name}
  end

  def self.find_or_create_by_name (name) 
    self.create_by_name (name) if self.find_by_name(name)==nil
    self.find_by_name(name) if self.find_by_name(name) !=nil
  end

  def self.alphabetical
    @@all.sort_by{|x|x.name}
  end

  def self.new_from_filename (filename)
    song=self.new
    # binding.pry
    song.artist_name=filename.split(" - ")[0]
    song.name=filename.split(" - ")[1].chomp(".mp3")
    # binding.pry
    song
  end

  def self.create_from_filename (filename) #same as above except we save
    song=self.new
    song.artist_name=filename.split(" - ")[0]
    song.name=filename.split(" - ")[1].chomp(".mp3")
    @@all<<song
    song
  end

  def self.destroy_all
    self.all.clear
  end

end

# tom=Song.new

# binding.pry