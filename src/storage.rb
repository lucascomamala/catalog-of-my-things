require 'json'

class Storage
  def self.load_data(class_name)
    return [] unless File.exist?("./data/#{class_name}.json")

    file = File.read("./data/#{class_name}.json")
    JSON.parse(file, create_additions: true)
  end

  def self.save_data(class_name, data)
    File.write("./data/#{class_name}.json", JSON.generate(data))
  end
end
