# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
require "csv"
hospis_csv=CSV.readlines("db/hospis.csv")
hospis_csv.shift
hospis_csv.each do |row|
  Hospis.create(remarkuser: row[1], remarkhospital: row[2],point: row[3], contents: row[4], address: row[5])
end