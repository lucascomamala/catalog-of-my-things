require 'json'
require 'fileutils'

module Storage
  def preserve_data
    puts "All the data has been saved successfully.\n"
    save_data('books')
    save_data('labels')
    save_data('games')
    save_data('authors')
    save_data('music_albums')
    save_data('genres')
  end

  def save_data(class_name)
    file_path = "./src/json/#{class_name}.json"
    object = []
    instance_variable_get("@#{class_name}").each do |item|
      object << item.to_s
    end
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, JSON.pretty_generate(object))
  end

  def load_games
    file = './src/json/games.json'
    list = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |item|
        game = Game.new(publish_date: item['publish_date'], multiplayer: item['multiplayer'], last_played: item['last_played'])
        game.archived = item['archived']
        game.label = label_select(item['label']['title'], item['label']['color'])
        game.genre = genre_select(item['genre']['name'])
        game.author = author_select(item['author']['first_name'], item['author']['last_name'])
        list << game
      end
    end
    list
  end

  def load_authors
    file = './src/json/authors.json'
    list = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |item|
        author = Author.new(first_name: item['first_name'], last_name: item['last_name'])
        list << author
      end
    end
    list
  end

  def load_music
    file = './src/json/music_albums.json'
    list = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |item|
        music_album = MusicAlbum.new(on_spotify: item['on_spotify'], publish_date: item['publish_date'])
        list << music_album
      end
    end
    list
  end

  def load_genres
    file = './src/json/genres.json'
    list = []
    if File.exist?(file) && !File.empty?(file)
      JSON.parse(File.read(file)).each do |item|
        genres = Genre.new(item['name'])
        list << genres
      end
    end
    list
  end

  def load_books
    file = './src/json/books.json'
    list_books = []
    if File.exist?(file) && !File.empty?(file)
      data = JSON.parse(File.read(file))
      data.each do |book|
        list_books << Book.new(book['title'], book['publisher'], book['cover_state'], book['publish_date'])
      end
    end
    list_books
  end

  def load_labels
    file = './src/json/labels.json'
    list_labels = []
    if File.exist?(file) && !File.empty?(file)
      data = JSON.parse(File.read(file))
      data.each { |label| list_labels << Label.new(label['title'], label['color']) }
    end
    list_labels
  end
end
