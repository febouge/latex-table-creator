# Table class
class Table
  attr_reader :rows, :columns, :data
  FINAL_TEXT = "\\end{tabular}\n\\caption{}\n\\label{}".freeze +
               "\n\\end{center}\n\\end{table}".freeze
  START_TEXT = "\\end{table}\n\\begin{center}\n\\begin{tabular}".freeze

  def initialize(rows, columns, table_data)
    @rows = rows
    @columns = columns
    @data = table_data
  end

  def ask_for_data_content
    @rows.times do |i|
      @columns.times do |j|
        puts "Introduce the element M#{i + 1}-#{j + 1}:"
        STDOUT.flush
        @data.push(gets.chomp.to_s)
      end
    end
  end

  def show_data
    @data.each do |element|
      puts element
    end
  end
end
