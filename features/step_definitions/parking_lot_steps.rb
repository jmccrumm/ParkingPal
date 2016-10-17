Given(/^The grid of parking spots are being shown$/) do
  #pending # Write code here that turns the phrase above into concrete actions
	parkinglot_path
	save_and_open_page
end

When(/^I click on a particular "([^"]*)"$/) do |location|
  #pending # Write code here that turns the phrase above into concrete actions
	parkingspot_path(location)
end

Then(/^I should see available options for that "([^"]*)"$/) do |location|
  #pending # Write code here that turns the phrase above into concrete actions
	#@spot = @parkingspot.find(location)
	parkinglot_path
	parkingspot_path(location)
	find("spotID").should be_visible
end
