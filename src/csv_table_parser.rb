require_relative 'constants.rb'
require_relative 'table.rb'
require 'csv'
# Csv table parser
# Class to convert CSV file in a table to be exported.
class CSVTableParser
  def initialize(path)
    @absolute_path = File.expand_path(path)
  end

  def parse_csv_to_table
    if valid_file?
      @content = CSV.read(@absolute_path)
      find_table_dimensions
      convert_file_content_to_array
      create_table
    else
      puts Constants::NO_VALID_FILE + @absolute_path
    end
  end

  private

  def create_table
    Table.new(@rows, @columns, @content)
  end

  def valid_file?
    File.exist?(@absolute_path)
  end

  def find_table_dimensions
    @rows = @content.length
    @columns = @content.at(0).length
  end

  def convert_file_content_to_array
    single_array_content = []
    @content.each do |row|
      row.each do |element|
        single_array_content.push(element)
      end
    end
    @content = single_array_content
  end
end
