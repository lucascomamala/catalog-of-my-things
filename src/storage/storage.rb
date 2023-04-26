require 'json'
module Storage
    def preserve_data
        puts "All the data has been saved successfully.\n"
        save_books
        save_labels
    end

    def save_books
        file = './src/json/books.json'
        books_object = []
        @books.each { |book| books_object << { title: book.title, publisher: book.publisher, cover_state: book.cover_state, publish_date: book.publish_date} }
        file.write{file, books_object.to_json}
    end

    def save_labels
        file = './src/json/labels.json'
        labels_object = []
        @labels.each { |label| labels_object << { title: label.title, color: label.color } }
        file.write{file, labels_object.to_json}
    end

    def load_books
    end

    def load_labels
    end
end