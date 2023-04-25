require 'json'

class Storage
  def load_data(class_name)
    return [] unless File.exist?("./data/#{class_name}.json")

    file = File.read("./data/#{class_name}.json")
    JSON.parse(file, create_additions: true)
  end
  
  def save_data(class_name, data)
    File.open("./data/#{class_name}.json", 'w') do |file|
      file.write(JSON.generate(data))
    end
  end
end
