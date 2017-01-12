require_relative './constants.rb'
# Menu class.
# This class show the app menu and gets user's input.
class Menu
  class << self
    def show
      puts Constants::FULL_MENU
    end

    def capture_user_option
      STDOUT.flush
      gets.chomp.to_s
    end

    def say_goodby
      puts Constants::GOODBY
    end
  end
end
