# Write methods that return SQL queries for each part of the challeng here
require_relative '../config/environment'
require_relative '../db/seed.rb'
require 'pry'


# FAREED ZAKARIA (19 appearances)
def guest_with_most_appearances
  DB[:conn].execute("SELECT Raw_Guest_List FROM guests GROUP BY Raw_Guest_List ORDER BY COUNT(id) DESC LIMIT 1")[0][0]
end

# What was the most popular profession of guest for each year? => ACTOR FOR EVERY YEAR
def most_common_profession_by_year
  year = 1999
  professions = []
  while year < 2016
    profession = [year]
    profession << DB[:conn].execute("SELECT GoogleKnowlege_Occupation FROM guests WHERE YEAR = ? GROUP BY GoogleKnowlege_Occupation ORDER BY COUNT(id) DESC LIMIT 1",year)[0][0]
    professions << profession
    year += 1
  end
  professions
end

# What profession was on the show most overall? => ACTOR (596 appearances)
def most_common_profession_overall
  DB[:conn].execute("SELECT GoogleKnowlege_Occupation FROM guests GROUP BY GoogleKnowlege_Occupation ORDER BY COUNT(id) DESC LIMIT 1")[0][0]
end

# How many people did Jon Stewart have on with the first name of Bill? => 61
def how_many_bills
  DB[:conn].execute("SELECT COUNT(id) FROM guests WHERE Raw_Guest_List LIKE '%Bill%'")[0][0]
end

# What dates did Patrick Stewart appear on the show? => 04/12/00, 04/21/03, 11/07/13
def patrick_stewart_appearance_dates
  DB[:conn].execute("SELECT Show FROM guests WHERE Raw_Guest_List = 'Patrick Stewart'")
end

# Which year had the most guests? => 2000 (169 guests)
def year_with_most_guests
  DB[:conn].execute("SELECT YEAR FROM guests GROUP BY YEAR ORDER BY COUNT(id) DESC LIMIT 1")[0][0]
end

# What was the most popular "Group" for each year Jon Stewart hosted? [[1999, "Acting"],[2000, "Acting"],[2001, "Acting"],[2002, "Acting"],[2003, "Acting"],[2004, "Acting"],[2005, "Media"],[2006, "Media"],[2007, "Media"],[2008, "Media"],[2009, "Media"],[2010, "Media"],[2011, "Media"],[2012, "Media"],[2013, "Acting"],[2014, "Media"],[2015, "Acting"]]
def most_common_group_by_year
  year = 1999
  groups = []
  while year < 2016
    group = [year]
    group << DB[:conn].execute("SELECT Category FROM guests WHERE YEAR = ? GROUP BY Category ORDER BY COUNT(id) DESC LIMIT 1",year)[0][0]

    groups << group
    year += 1
  end
  groups
end
