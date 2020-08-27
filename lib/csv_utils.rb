# encoding: utf-8

require 'csv'

module CSVUtils
	extend self

	# csvtable : CSV::Table
	# field_names : Array[String]
	# out : CSV::Table
	def projection(csvtable, field_names)
		cols=[]
		field_names.map do |cn|
			cols << csvtable[1].headers.index(cn)
		end

		out = CSV::Table.new([])
		csvtable.each do |row|
			out << CSV::Row.new(field_names, row.fields(*cols))
		end
		return out
	end

	def restriction(csvtable,&block)
		return csvtable.filter &block
	end

	def row_with_table_name(row, table_name)
		return CSV::Row.new(row.headers.map{|f| "#{table_name}.#{f}"},row.fields)
	end
	
	def table_with_table_name(table, table_name)
		new_table = CSV::Table.new([])
		table.each do |row|
			if row.header_row? then
			else 
				new_table << row_with_table_name(row,table_name)
			end
		end
		return new_table
	end
	
	def inner_join(csvtable_a, csvtable_b, table_name_a, table_name_b, field_name)
		table_a = table_with_table_name(csvtable_a, table_name_a)
		table_b = table_with_table_name(csvtable_b, table_name_b)
		
		new_table = CSV::Table.new([])
		table_a.each do |row_a|
			if !row_a.header_row? then
				field_a = row_a["#{table_name_a}.#{field_name}"]
				b_matched_a = restriction(table_b) { |r|
					r["#{table_name_b}.#{field_name}"].eql?(field_a)
					}

				b_matched_a.each do |row_b|
					new_table << CSV::Row.new(	row_a.headers + row_b.headers ,
												row_a.fields  + row_b.fields)
				end
			end
		end
		return new_table
	end
	
	def left_outer_join(csvtable_a, csvtable_b, field_names)
	end
	
	def right_outer_join(csvtable_a, csvtable_b, field_names)
		return left_outer_join(csvtable_b, csvtable_a, field_names)
	end
	
	def union(csvtables)
	end
	
	def union_all(csvtables)
	end
	
	def difference()
	end
	
	def intersection()
	end
	
	def cartesian_product()
	end
end