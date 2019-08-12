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
    new_song = self.new
    new_song.save
    new_song
  end

  def self.new_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song
  end

  def self.create_by_name(name)
    new_song = self.new
    new_song.name = name
    new_song.save
    new_song
  end

  def self.find_by_name(name)
    self.all.find {|song| song.name == name}
  end

  def self.find_or_create_by_name(name)
    found_song = self.find_by_name(name)
    if found_song == nil
      new_song = self.create_by_name(name)
      new_song
    else
      found_song
    end
  end

  def self.alphabetical
    self.all.sort_by do |song|
      song.name
    end
  end

  def self.new_from_filename(filename)
    filename_string = filename.split("-")
    artist_name = filename_string[0]
    song = filename_string[1].split(".")
    song_name = song[0]

    new_song = self.new
    new_song.name = song_name.strip
    new_song.artist_name = artist_name.strip
    new_song
    # binding.pry
  end

  def self.create_from_filename(filename)
    filename_string = filename.split("-")
    artist_name = filename_string[0]
    song = filename_string[1].split(".")
    song_name = song[0]

    new_song = self.create
    new_song.name = song_name.strip
    new_song.artist_name = artist_name.strip
    new_song
  end

  def self.destroy_all
    @@all = []
  end
end
# binding.pry
# 0