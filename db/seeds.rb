# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)
Cat.create!(:name => 'Hamilton', :sex => 'M', :color => 'black', :age => 1)
Cat.create!(:name => 'Susie', :sex => 'F', :color => 'brown', :age => 2)
Cat.create!(:name => 'Patrick', :sex => 'M', :color => 'brown', :age => 2)