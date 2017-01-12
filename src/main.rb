require_relative './menu.rb'
require_relative './constants.rb'
require_relative './latex_table_writer.rb'
require_relative './table.rb'
require_relative './csv_table_parser.rb'
# Main app class
class Main
  class << self
    def start
      until @option.eql?(4.to_s)
        Menu.show
        @option = Menu.capture_user_option
        process_user_option
      end
      Menu.say_goodby
    end

    private

    def process_user_option
      case @option
      when 1.to_s
        @table = fill_new_table
      when 2.to_s
        @table = import_csv_table
      when 3.to_s
        filename = LatexTableWriter.export_latex_table(@table) unless @table.nil?
        puts Constants::SAVED_FILE + filename
      when 4.to_s
        puts Constants::EXIT_OPTION
      when 5.to_s
        @table.show_data
      else
        puts Constants::INVALID_OPTION
      end
    end

    def fill_new_table
      rows = ask_for_table_property(Constants::SELECT_ROWS)
      columns = ask_for_table_property(Constants::SELECT_COLUMNS)
      table = Table.new(rows, columns)
      table.fill_data
      table
    end

    def ask_for_table_property(text_to_show)
      opc = nil
      until opc
        puts text_to_show
        STDOUT.flush
        opc = gets.chomp.to_i
      end
      opc
    end

    def import_csv_table
      puts Constants::ASK_FOR_FILE_PATH
      filepath = Menu.capture_user_option
      table_parser = CSVTableParser.new(filepath)
      table_parser.parse_csv_to_table
    end
  end
end
