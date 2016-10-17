Given(/^The grid of parking spots are being shown$/) do
  #pending # Write code here that turns the phrase above into concrete actions
	#visit (parkinglot_path)
end

When(/^I click on a particular "([^"]*)"$/) do |location|
  #pending # Write code here that turns the phrase above into concrete actions
	visit parkingspot_path(location)
end

Then(/^I should see available options for that "([^"]*)"$/) do |location|
  #pending # Write code here that turns the phrase above into concrete actions
	@spot = ParkingSpot.find_by_location(location)
	expect(page).to have_content(@spot.location)
	expect(page).to have_content(@spot.status)
end
