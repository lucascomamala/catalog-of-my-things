require_relative 'app'

def main
  system('cls')
  system('clear')
  puts "Welcome to the catalog of my things"

  app = App.new
  app.run

  puts "Thank you for using our app!"
end

main
