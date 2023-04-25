module Utils
  def date_validation
    begin
      date = Date.parse(gets.chomp)
    rescue ArgumentError
      puts 'Invalid date format. Please try again (YYYY/MM/DD): '
      retry
    end
    date
  end

  def bool_validation
    multiplayer = gets.chomp.downcase
    while multiplayer != 'y' && multiplayer != 'n'
      puts 'Invalid choice. Please try again (y/n): '
      multiplayer = gets.chomp.downcase
    end
    multiplayer == 'y'
  end
end
