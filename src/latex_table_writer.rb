require_relative './constants.rb'
require_relative './table.rb'

# This class composes a latex table from a Table class and prints it
# to a file.
class LatexTableWriter
  def initialize(table)
    @table = table
  end

  def export_latex_table
    puts Constants::SELECT_FILENAME
    STDOUT.flush
    @filename = gets.chomp.to_s
    @filename = check_valid_filename
    File.open(@filename, 'w') { |file| file.write(compose_latex_table) }
    File.absolute_path(@filename)
  end

  private

  def compose_latex_table
    @latex_table = Constants::TABLE_BEGIN + generate_centered_definition +
                   Constants::H_SEPARATOR
    @table.rows.times do |i|
      @table.columns.times do |j|
        @latex_table += @table.data[i + j].to_s
        @latex_table += Constants::V_SEPARATOR unless @table.columns.eql?(j + 1)
      end
      @latex_table += Constants::TABLE_NEXT_ROW
    end
    @latex_table += Constants::TABLE_FINAL
  end

  def check_valid_filename
    while File.exist?(@filename)
      puts Constants::EXISTING_FILE
      STDOUT.flush
      @filepath = gets.chomp.to_s
    end
    put_file_extension
  end

  def generate_centered_definition
    centered_columns = Constants::CENTER_COLUMN * @table.columns.to_i
    Constants::CENTER_START + centered_columns + Constants::CENTER_END
  end

  def put_file_extension
    unless @filename.include? Constants::FILE_EXTENSION
      @filename += Constants::FILE_EXTENSION
    end
    @filename
  end
end
