class Artist
  extend Concerns::Findable
  attr_accessor :name, :songs


  @@all = []

  def initialize(name)
    @name = name
    @songs = []
  end

  def self.all
    @@all
  end

  def self.destroy_all
    @@all.clear
  end

  def save
    @@all << self
  end

  def self.create(name)
    new(name).tap{|s| s.save}
  end

  def add_song(song)
    song.artist = self if song.artist.nil?
    @songs << song unless @songs.include?(song)
  end

  def genres
    self.songs.map{|song| song.genre}.uniq
  end

end
