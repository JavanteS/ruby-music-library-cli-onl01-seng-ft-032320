class Genre 
  
  extend Concerns::Findable
  
   attr_accessor :name
   
   @@all = []
   def initialize(name)
     @name = name 
     @songs = []
    
   end 
   
   
   
   def add_song(song)
     @songs << song unless @songs.include?(song)
     song.genre = self if song.genre == nil  
   end 
   
   
   
   def songs 
     @songs 
   end 
   
   def artists
     artist = @songs.collect do |song| song.artist 
   end 
   artist.uniq 
   end 
     
   def save 
     @@all << self 
   end 
   
   def self.all 
     @@all 
   end
   
   def self.destroy_all 
     @@all.clear 
   end 
   
    def self.create(name)
     genre = Genre.new(name)
     genre.save 
     genre 
   end
   
   
end 