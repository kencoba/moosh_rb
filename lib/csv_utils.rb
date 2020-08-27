# encoding: utf-8

require 'csv'

module CSVUtils
	extend self

	# csvdata : CSV::Table
	# column_names : Array[String]
	# out : CSV::Table
	def projection(csvdata, column_names)
		cols=[]
		column_names.map do |cn|
			cols << csvdata[1].headers.index(cn)
		end

		out = CSV::Table.new([])
		csvdata.each do |row|
			out << CSV::Row.new(column_names,row.fields(*cols))
		end
		return out
	end
end