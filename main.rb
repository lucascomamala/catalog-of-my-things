require_relative 'app'

def main
  system('cls')
  system('clear')
  puts "Welcome to the catalog of my things\n"

  app = App.new
  app.run
end

main
