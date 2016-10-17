Given(/^The spot is taken \(red\)$/) do | location |
  pending # Write code here that turns the phrase above into concrete actions
	visit parkingspot_path(location)
	@spot = ParkingSpot.find_by_location(location)
	@spot.status == 'taken' # not sure correct syntax for this line
end

When(/^I click on "([^"]*)"$/) do |arg1|
  pending # Write code here that turns the phrase above into concrete actions
end


Then(/^I should have a list of options to see a countdown of when the spot will be open, mark the spot as open already, or message the user currently holding that spot$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

