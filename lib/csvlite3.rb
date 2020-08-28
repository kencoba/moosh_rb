# encoding: utf-8

require 'csv'
require 'sqlite3'
require 'tempfile'

class CSVlite3
  def initialize(dbfilename)
    @dbfilename = dbfilename
  end
  
  def destroy
    File.delete(@dbfilename) if File.exist?(@dbfilename)
  end
  
  def create(table_name, csvtable)
    Tempfile.create do |csv_file|
      csv_file.write csvtable.to_s
      csv_file.flush
      system("sqlite3 -separator , #{@dbfilename} \".import #{csv_file.path} #{table_name}\"")
    end
  end
  
  def query(sql)
    begin
      db = SQLite3::Database.open @dbfilename
      db.results_as_hash = true
      statement = db.prepare sql
      results = statement.execute
      
      csvtable = CSV::Table.new([])
      results.each do |row|
        headers = row.keys
        values = row.values
        csvtable << CSV::Row.new(headers,values)
      end
      return csvtable
    ensure
      statement.close if statement
      db.close if db
    end
  end
end