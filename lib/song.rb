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

  def self.create
    song = self.new
    @@all << song
    song
  end

  def self.new_by_name(song_name)
    song = self.new
    song.name = song_name
    song 
  end

  def self.create_by_name(song_name)
    song = self.new
    song.name = song_name 
    @@all << song 
    song
  end

  def self.find_by_name(song_name)
    self.all.find do |song|
      song.name == song_name
    end
  end

  def self.find_or_create_by_name(song_name)
    if self.all.include?(self.find_by_name(song_name))
      return self.find_by_name(song_name)
    else
      return self.create_by_name(song_name)
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name 
    end
  end

  def self.new_from_filename(file_name)
    song = self.new 
    file = file_name.split(" - ")
    song.name = file[1].split(".")[0]
    song.artist_name = file[0] 
    song
  end

  def self.create_from_filename (file_name)
    song = self.new_from_filename(file_name)
    @@all << song 
  end

  def self.destroy_all
    @@all.clear 
  end 
  
end

# song_1 = Song.find_or_create_by_name("Blank Space")
# the_middle = Song.create_by_name("The Middle")
# Song.alphabetical
#song = Song.new_from_filename("Taylor Swift - Blank Space.mp3") 
