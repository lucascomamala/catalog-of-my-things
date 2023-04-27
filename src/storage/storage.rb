require 'json'
require 'fileutils'

module Storage
  def preserve_data
    puts "All the data has been saved successfully.\n"
    save_books
    save_labels
    save_data('games')
    save_data('authors')
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

  def save_books
    file_path = './src/json/books.json'
    books_object = []
    @books.each do |book|
      books_object << { title: book.title, publisher: book.publisher, cover_state: book.cover_state,
                        publish_date: book.publish_date }
    end
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, books_object.to_json)
  end

  def save_labels
    file_path = './src/json/labels.json'
    labels_object = []
    @labels.each { |label| labels_object << { title: label.title, color: label.color } }
    FileUtils.mkdir_p(File.dirname(file_path))
    File.write(file_path, labels_object.to_json)
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
