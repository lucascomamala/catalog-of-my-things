require 'date'
require_relative '../items/music_album'
require_relative '../associations/genre'
require_relative 'utils'

module MusicModule
  include Utils
  def add_music
    # Gets publish date and validates it
    puts 'When was the music album published [YYYY/MM/DD]?: '
    publish_date = date_validation

    # Gets on_spotify bool and validates it
    puts 'Is the music on spotify? [y/n]: '
    on_spotify = onspotify_validation

    puts 'Add a music_album name: '
    name = gets.chomp

    # Creates music object
    music_album = MusicAlbum.new(on_spotify: on_spotify, publish_date: publish_date)

    # Selects genre
    genre = genre_select(name)
    music_album.genre = genre

    # Adds music_album object to @music_albums array
    @music_albums << music_album
  end

  def list_music
    if @music_albums.empty?
      puts "\nNo music_albums added yet! Please add some music."
    else
      puts "\nList of all music_albums:"
      @music_albums.each do |album|
        puts '{'
        puts "  ID: #{album.id}"
        puts "  on_spotify?: #{album.on_spotify}"
        puts "  Publish Date: #{album.publish_date}"
        puts "  Archived: #{album.archived}"
        puts '}'
      end
    end
    puts "\nPress Enter to return to main menu..."
    gets.chomp
  end
end
