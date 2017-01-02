# Table class
class Table
  attr_reader :rows, :columns, :data
  attr_writer :table

  def initialize(rows, columns, data = [])
    @rows = rows
    @columns = columns
    @data = data
  end

  def fill_data
    @rows.times do |i|
      @columns.times do |j|
        puts "Introduce the element M#{i + 1}-#{j + 1}:"
        STDOUT.flush
        @data.push(gets.chomp.to_s)
      end
    end
  end

  def show_data
    @rows.times do |i|
      @columns.times do |j|
        print @data.at(i + j)
        print ' ' unless @columns.eql?(j + 1)
      end
      print "\n" unless @rows.eql?(i + 1)
    end
    puts ''
  end
end
