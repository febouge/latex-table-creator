require_relative './constants.rb'
require_relative './table.rb'

# This class composes a latex table from a Table class and prints it
# to a file.
class LatexTableWriter
  class << self
    def export_latex_table(table)
      puts Constants::SELECT_FILENAME
      STDOUT.flush
      filename = gets.chomp.to_s
      filename = get_valid_file(filename)
      File.open(filename, 'w') { |file| file.write(compose_latex_table(table)) }
      File.absolute_path(filename)
    end

    private

    def compose_latex_table(table)
      @latex_table = Constants::TABLE_BEGIN +
                     generate_centered_definition(table) +
                     Constants::H_SEPARATOR
      table.rows.times do |i|
        table.columns.times do |j|
          @latex_table += table.data[i + j].to_s
          @latex_table += Constants::V_SEPARATOR unless table.columns.eql?(j + 1)
        end
        @latex_table += Constants::TABLE_NEXT_ROW
      end
      @latex_table += Constants::TABLE_FINAL
    end

    def get_valid_file(filepath)
      while File.exist?(filepath)
        puts Constants::EXISTING_FILE
        STDOUT.flush
        filepath = gets.chomp.to_s
      end
      put_file_extension(filepath)
    end

    def generate_centered_definition(table)
       return Constants::CENTER_START + Constants::CENTER_COLUMN * table.columns.to_i +
       Constants::CENTER_END
    end

    def final_column(number, table)
      table.columns == number
    end

    def put_file_extension(filename)
      unless filename.include? Constants::FILE_EXTENSION
        filename += Constants::FILE_EXTENSION
      end
      filename
    end
  end
end
