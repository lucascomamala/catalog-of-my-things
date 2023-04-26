require_relative './src/app'

def main
  system('cls')
  system('clear')
  puts 'Welcome to the catalog of my things'

  app = App.new
  app.run

  puts 'Thank you for using our app!'
  app.preserve_data
  exit
end

main
