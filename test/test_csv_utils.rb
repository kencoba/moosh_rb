require "test/unit"
require "csv"
require_relative "../lib/csv_utils"

class CSVUtilsTest < Test::Unit::TestCase
  def test_projection
    row_a_1 = CSV::Row.new(["ha","hb","hc"],["1","2","3"])
    row_a_2 = CSV::Row.new(["ha","hb","hc"],["4","5","6"])
    table_a = CSV::Table.new([row_a_1,row_a_2])

    actual = CSVUtils::projection(table_a,["ha","hb"])

    assert_equal(table_a.size,actual.size,"projection does not affect the number of rows.")
    assert_equal(table_a[1]["hb"],actual[1]["hb"],"actual data should contain the same data.")
    assert_nil(actual[1]["hc"],"actual data should contain only projected data.")
  end
  
  def test_inner_join
    row_a_1 = CSV::Row.new(["ha","hb","hc"],["1","2","3"])
    row_a_2 = CSV::Row.new(["ha","hb","hc"],["4","5","6"])
    row_a_3 = CSV::Row.new(["ha","hb","hc"],["7","8","9"])
    table_a = CSV::Table.new([row_a_1,row_a_2,row_a_3])
	
    row_b_1 = CSV::Row.new(["hd","he","hc"],["1","2","3"])
    row_b_2 = CSV::Row.new(["hd","he","hc"],["4","5","3"])
    row_b_3 = CSV::Row.new(["hd","he","hc"],["4","5","6"])
    row_b_4 = CSV::Row.new(["hd","he","hc"],["7","8","8"])
    table_b = CSV::Table.new([row_b_1,row_b_2,row_b_3,row_b_4])
	
    actual = CSVUtils::inner_join(table_a,table_b,"ta","tb","hc")
	
    assert_equal(3,actual.size,"the result table should contain the rows which hc = 3(2 rows) and hc = 6 (1 row).")
	
  end
  
  def test_restriction
    row_a_1 = CSV::Row.new(["ha","hb","hc"],["1","2","3"])
    row_a_2 = CSV::Row.new(["ha","hb","hc"],["4","5","6"])
    row_a_3 = CSV::Row.new(["ha","hb","hc"],["7","8","9"])
    table_a = CSV::Table.new([row_a_1,row_a_2,row_a_3])
  
    actual = CSVUtils::restriction(table_a) {|row| row["hb"].to_i > 4}
  
    assert_equal(2,actual.size,"the result rows of the table should contain hb = 5 or hb = 8")
  end
end