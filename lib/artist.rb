class Artist
    attr_accessor :name, :songs

    @@all = []
  
    def initialize(name)
      @name = name
      @songs = []
      @@all << self
    end
  
    def songs 
        Song.all.select do |song|
            song.artist == self
        end
    end

    def add_song(song)
      song.artist = self
    end
  
    def self.all
      @@all
    end
  
   def self.find_or_create_by_name(name)
   # self.all.detect {|artist| artist.name == name || Artist.new(name)}
    artist_name = @@all.detect{ |x| x.name == name }
    if artist_name == nil
        Artist.new(name)
    else
        artist_name
    end
end

    def print_songs
        self.songs.each { |song| puts song.name }
    end

end