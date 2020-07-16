require 'pry'

class Song
  attr_accessor :name, :artist_name
  @@all = []
  
  def self.all
    @@all
  end
  
  # def save
  #   self.class.all << self
  # end

  def self.create
    song = Song.new
    Song.all << song
    song
  end
  
  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = Song.create
    song.name = name
    song
  end

  def self.find_by_name(name)
    Song.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    song = Song.find_by_name(name)
    if song
      song
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    Song.all.sort_by {|song| song.name}
  end

  def self.new_from_filename(filename)
    file = filename.split(' - ')
    name = file[1].split('.')[0]
    song = Song.new_by_name(name)
    song.artist_name = file[0]
    song
  end

  def self.create_from_filename(filename)
    file = filename.split(' - ')
    name = file[1].split('.')[0]
    song = Song.create_by_name(name)
    song.artist_name = file[0]
    song
  end

  def self.destroy_all
    Song.all.clear
  end
end
