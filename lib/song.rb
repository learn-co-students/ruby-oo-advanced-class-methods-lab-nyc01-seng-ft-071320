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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(name)
    song = Song.new
    song.name = name
    song
  end

  def self.create_by_name(name)
    song = self.new_by_name(name)
    song.save
    song
  end

  def self.find_by_name(name)
    Song.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    if Song.find_by_name(name)
      Song.find_by_name(name)
    else
      Song.create_by_name(name)
    end
  end

  def self.alphabetical
    song_names = Song.all.map {|song| song.name}
    song_names.sort.map {|song_name| Song.find_by_name(song_name)}
  end

  def self.new_from_filename(filename)
    song_attrs = filename.split(' - ')
    song = Song.new
    song.artist_name = song_attrs[0]
    song.name = song_attrs[1][0..-5]
    song
  end

  def self.create_from_filename(filename)
    song = Song.new_from_filename(filename)
    song.save
    song
  end

  def self.destroy_all
    Song.all.clear
  end
end
