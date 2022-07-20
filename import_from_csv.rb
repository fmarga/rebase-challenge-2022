require './setup_database'

SetupDatabase.new.drop_table
SetupDatabase.table
SetupDatabase.insert('./data.csv')