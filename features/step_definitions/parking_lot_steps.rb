Given(/^The grid of parking spots are being shown$/) do
	visit 'parkinglot_path'
end
When(/^I click on a particular spot$/) do
	visit 'parkingspot_path'
end
Then(/^I should see available options for that spot$/) do | location |
	@spot = ParkingSpot.find_by_location(location)
	expect(page).to have_content(@spot.location)
	expect(page).to have_content(@spot.status)
end