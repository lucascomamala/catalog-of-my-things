require 'json'

class Storage
  def self.load_data(class_name)
    return [] unless File.exist?(".src//data/#{class_name}.json")

    file = File.read("./data/#{class_name}.json")
    JSON.parse(file, create_additions: true)
  end

  def self.save_data(class_name, data)
    dir = './src/data'
    Dir.mkdir(dir) unless Dir.exist?(dir)
    File.write("./src/data/#{class_name}.json", JSON.pretty_generate(data))
  end
end
