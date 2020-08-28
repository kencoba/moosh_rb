require "test/unit"
require "csv"
require_relative "../lib/csv_utils"

class CSVlite3Test < Test::Unit::TestCase
  def test_new
    File.delete("test_new.db") if File.exist?("test_new.db")
    db = CSVlite3.new("test_new.db")
    
    assert_false(File.exist?("test_new.db"),"database file must not be exist.")
  end
  
  def test_destory
    File.delete("test_destroy.db") if File.exist?("test_destroy.db")
    db = CSVlite3.new("test_destroy.db")
    
    db.destroy
    assert_false(File.exist?("test_destroy.db"),"database file must be deleted.")
  end
  
  def test_create
    File.delete("test_create.db") if File.exist?("test_create.db")
    db = CSVlite3.new("test_create.db")

    row_a_1 = CSV::Row.new(["ha","hb","hc"],["1","2","3"])
    row_a_2 = CSV::Row.new(["ha","hb","hc"],["4","5","6"])
    table_a = CSV::Table.new([row_a_1,row_a_2])

    result = db.create("table_a",table_a)
    
    assert_true(result,"db#create must be exited properly.")    
    File.delete("test_create.db") if File.exist?("test_create.db")
  end
  
  def test_query
    File.delete("test_query.db") if File.exist?("test_query.db")
    db = CSVlite3.new("test_query.db")

    row_a_1 = CSV::Row.new(["ha","hb","hc"],["1","2","3"])
    row_a_2 = CSV::Row.new(["ha","hb","hc"],["4","5","6"])
    table_a = CSV::Table.new([row_a_1,row_a_2])

    db.create("table_a",table_a)
    
    actual = db.query("select * from table_a")
    assert_true(actual.is_a?(CSV::Table),"The type of the return value must be CSV::Table.")
    assert_equal(2,actual.size,"The all record must be extracted.")
    File.delete("test_query.db") if File.exist?("test_query.db")
  end
end
