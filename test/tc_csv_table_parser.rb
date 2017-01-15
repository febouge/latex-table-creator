require_relative '../src/csv_table_parser.rb'
require 'helper'

# Test for Table class.
class TestCSVTableParser < Test::Unit::TestCase
  def test_parser_initialize
    parser = CSVTableParser.new('test/testdata/test.csv')
    assert_kind_of(CSVTableParser, parser, 'Object must be an instance of CSVTableParser')
  end

  def test_parse_csv_to_table
    parser = CSVTableParser.new('test/testdata/test.csv')
    table = parser.parse_csv_to_table
    assert_kind_of(Table, table, 'Object must be an instance of Table')
    assert_equal(2, table.columns, 'Columns must be 2')
    assert_equal(2, table.rows, 'Rows must be 2')
    assert_equal('1', table.data.at(0), 'The first element must be 1')
    assert_equal('2', table.data.at(1), 'The second element must be 2')
    assert_equal('3', table.data.at(2), 'The third element must be 3')
    assert_equal('4', table.data.at(3), 'The fourth element must be 4')
  end
end
