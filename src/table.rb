# Table class
class Table
  attr_reader :rows, :columns, :data

  def initialize(rows, columns)
    @rows = rows
    @columns = columns
    @data = []
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
        print @data[i + j]
        print ' ' until @columns.eql?(j + 1)
      end
    end
  end
end
