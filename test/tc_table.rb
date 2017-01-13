require_relative '../src/table.rb'
# require_relative 'helper.rb'
require 'test/unit'

# Test for Table class.
class TestTable < Test::Unit::TestCase
  def test_table_initialize
    table = Table.new(2, 10)
    assert_kind_of(Table, table, 'Object must be an instance of Table')
    assert_equal(2, table.rows, 'Rows must be 2')
    assert_equal(10, table.columns, 'Columns must be 10')
    assert_equal([], table.data, 'The object must not have data')
  end

  def test_table_initialize_with_data
    table = Table.new(2, 2, [1, 2, 3, 4])
    assert_kind_of(Table, table, 'Object must be an instance of Table')
    assert_equal([1, 2, 3, 4], table.data)
    assert_equal(2, table.rows, 'Rows must be 2')
    assert_equal(2, table.columns, 'Columns must be 2')
  end
end
