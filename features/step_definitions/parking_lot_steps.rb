Given(/^The grid of parking spots are being shown$/) do
  #pending # Write code here that turns the phrase above into concrete actions
	visit parkinglot_path
	save_and_open_page
end

When(/^I click on a particular "([^"]*)"$/) do |id|
  #pending # Write code here that turns the phrase above into concrete actions
	visit parkingspot_path(id)
end

Then(/^I should see available options for that "([^"]*)"$/) do |id|
  #pending # Write code here that turns the phrase above into concrete actions
	@spot = Parkingspot.find_by_id(id)
	expect(page).to have_content(@spot.id)
	expect(page).to have_content(@spot.status)
	#@spot = @parkingspot.find(location)
	parkinglot_path
	parkingspot_path(id)
	find("spotID").should be_visible
end
