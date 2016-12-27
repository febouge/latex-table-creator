require './table.rb'

# This class composes a latex table from a Table class and prints it
# to a file.
class LatexTableWriter
  START_TEXT = "\\begin{table}\n\\begin{center}\n\\begin{tabular}".freeze
  FINAL_TEXT = "\\end{tabular}\n\\caption{}\n\\label{}".freeze +
               "\n\\end{center}\n\\end{table}\n".freeze
  VERTICAL_SEPARATOR = "\&".freeze
  HORIZONTAL_SEPARATOR = "\\hline\n".freeze

  def self.export_latex_table(table, filename)
    filename = get_valid_file(filename)
    File.open(filename, 'w') { |file| file.write(compose_latex_table(table)) }
  end

  def self.compose_latex_table(table)
    @latex_table = START_TEXT + generate_centered_definition(table) +
                   HORIZONTAL_SEPARATOR
    table.rows.times do |i|
      table.columns.times do |j|
        @latex_table += table.data[i + j].to_s
        !final_column(j + 1, table) && @latex_table += VERTICAL_SEPARATOR
      end
      @latex_table += "\\\\\n" + HORIZONTAL_SEPARATOR
    end
    @latex_table += FINAL_TEXT
  end

  def self.get_valid_file(filepath)
    while File.exist?(filepath)
      puts 'The selected file already exists. Please pick another one'
      STDOUT.flush
      filepath = gets.chomp.to_s
    end
    filepath
  end

  def self.generate_centered_definition(table)
    centered_column = 'c|'
    result = '{|'
    table.rows.times do
      result += centered_column
    end
    result += "}\n"
  end

  def self.final_column(number, table)
    table.columns == number
  end

  private_class_method :compose_latex_table, :get_valid_file,
                       :generate_centered_definition, :final_column
end
