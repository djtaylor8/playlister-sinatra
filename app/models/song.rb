class Song < ActiveRecord::Base 
    belongs_to :artist
    has_many :song_genres
    has_many :genres, through: :song_genres
    
    def slug
        self.name.downcase.strip.gsub(' ', '-').gsub(/[^\w-]/, '')
    end

    def self.find_by_slug(slug)
        name = slug.gsub('-', ' ').titleize
        Song.find_by(:name => name) 
    end
end