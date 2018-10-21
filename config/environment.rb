require 'bundler'
Bundler.require


# Setup a DB connection here
DB = { :conn => SQLite3::Database.new("db/guests.db") }
DB[:conn].execute("DROP TABLE IF EXISTS guests")

sql = <<-SQL
  CREATE TABLE IF NOT EXISTS guests (
  id INTEGER PRIMARY KEY,
  YEAR TEXT,
  GoogleKnowlege_Occupation TEXT,
  Show TEXT,
  Category TEXT,
  Raw_Guest_List TEXT
  )
SQL

DB[:conn].execute(sql)
# DB[:conn].results_as_hash = true

require_relative '../lib/queries.rb'
