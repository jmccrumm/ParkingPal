# This file should contain all the record creation needed to seed the database with its default values.
# The data can then be loaded with the rake db:seed (or created alongside the db with db:setup).
#
# Examples:
#
#   cities = City.create([{ name: 'Chicago' }, { name: 'Copenhagen' }])
#   Mayor.create(name: 'Emanuel', city: cities.first)

parkinglots = [{name: 'Main Lot', rows: '10'}]
parkinglots.each do |lot|
	Parkinglot.create!(lot)
end

parkingspots = [{parkinglot_id: '1', spot_type: 'handicap', status: 'open'}, {parkinglot_id: '1', spot_type: 'handicap', status: 'taken', occupying: '1'}, 
	{parkinglot_id: '1', spot_type: 'handicap', status: 'reserved', occupying: '2'}, {parkinglot_id: '1', spot_type: 'normal', status: 'open'},
	{parkinglot_id: '1', spot_type: 'normal', status: 'taken', occupying: '3'}, {parkinglot_id: '1', spot_type: 'normal', status: 'reserved', occupying: '4'},
	{parkinglot_id: '1', spot_type: 'normal', status: 'open'}, {parkinglot_id: '1', spot_type: 'normal', status: 'open'}, {spot_type: 'normal', status: 'open'},
	{parkinglot_id: '1', spot_type: 'normal', status: 'open'}, {parkinglot_id: '1', spot_type: 'normal', status: 'open'}, {spot_type: 'normal', status: 'open'},
	{parkinglot_id: '1', spot_type: 'normal', status: 'open'}, {parkinglot_id: '1', spot_type: 'normal', status: 'taken', occupying: '5'},
	{parkinglot_id: '1', spot_type: 'normal', status: 'open'}, {parkinglot_id: '1', spot_type: 'normal', status: 'taken', occupying: '6'},
	{parkinglot_id: '1', spot_type: 'normal', status: 'reserved', occupying: '7'}, {parkinglot_id: '1', spot_type: 'normal', status: 'taken', occupying: '8'},
	{parkinglot_id: '1', spot_type: 'normal', status: 'open'}, {parkinglot_id: '1', spot_type: 'normal', status: 'open'}, {spot_type: 'normal', status: 'open'}
]
@mainlot = Parkinglot.find(1)
parkingspots.each do |spot|
	Parkingspot.create!(spot)
end
spot_id = 1
parkingspots.each do |spot|
	@mainlot.parkingspots << Parkingspot.find(spot_id)
	spot_id = spot_id + 1
end