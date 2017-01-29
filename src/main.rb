require_relative './menu.rb'
require_relative './constants.rb'
require_relative './latex_table_writer.rb'
require_relative './table.rb'
require_relative './csv_table_parser.rb'
# Main app class
class Main
  def initialize
    @exit_option = 5.to_s
    @menu = Menu.new
  end

  def start
    until @option.eql?(@exit_option)
      @menu.show
      @option = @menu.capture_user_option
      process_user_option
    end
    @menu.say_goodby
  end

  private

  def process_user_option
    case @option
    when 1.to_s
      @table = fill_new_table
    when 2.to_s
      @table = import_csv_table
    when 3.to_s
      export_table_to_file unless @table.nil?
    when 4.to_s
      @table.show_data unless @table.nil?
    when 5.to_s
      puts Constants::EXIT_OPTION
    else
      puts Constants::INVALID_OPTION
    end
  end

  def export_table_to_file
    return if @table.nil?
    writer = LatexTableWriter.new @table
    filename = writer.export_latex_table
    puts Constants::SAVED_FILE + filename
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
    filepath = @menu.capture_user_option
    table_parser = CSVTableParser.new(filepath)
    table_parser.parse_csv_to_table
  end
end
