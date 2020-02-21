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
    song = Song.new
    song.save
    song
  end

  def self.new_by_name(title)
    song = self.new
    song.name = title
    song
  end 

  def self.create_by_name(title)
    song = self.create
    song.name = title
    song
  end 

  def self.find_by_name(title)
    result = self.all.detect {|song| song.name == title}
    result
  end 
  
  def  self.find_or_create_by_name(title)
    if self.find_by_name(title)
      self.find_by_name(title)
    else
      self.create_by_name(title)
   end 
  end 
  def self.alphabetical
    self.all.sort_by {|song| song.name}
  end
 def self.new_from_filename(title)
  track = title.split (" - ")
  lp = track[1].split (".")
  butts = self.new_by_name(lp[0])
  butts.artist_name = track[0]
  butts
 end
 def self.create_from_filename(title)
  track = title.split (" - ")
  lp = track[1].split (".")
  butts = self.create_by_name(lp[0])
  butts.artist_name = track[0]
  butts
 end  
 def self.destroy_all
  @@all.clear
 end
end
