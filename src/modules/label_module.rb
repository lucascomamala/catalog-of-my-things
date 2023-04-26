require_relative '../associations/label'

module LabelModule
  def list_labels
    puts 'No Labels added yet! Please add some labels' if @labels.empty?
    @labels.each_with_index do |label, index|
      puts "#{index}) Title: #{label.title} - Color: #{label.color}"
    end
  end
end
