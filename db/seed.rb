# Parse the CSV and seed the database here! Run 'ruby db/seed' to execute this code.
require_relative '../config/environment'
require 'pry'
require 'sqlite3'

csv = CSV.read("daily_show_guests.csv")
columns = csv.shift
columns = columns.map do |column|
  if column == "Group"
    "Category"
  else
    column
  end
end

csv.each do | row |
  sql = <<-SQL
    INSERT INTO guests (#{columns[0]}, #{columns[1]}, #{columns[2]}, #{columns[3]}, #{columns[4]})
    VALUES (?,?,?,?,?)
  SQL
  DB[:conn].execute(sql, row[0], row[1], row[2], row[3], row[4])
end
