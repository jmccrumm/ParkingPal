Given(/^The grid of parking spots are being shown$/) do
	visit parkinglot_path
	#save_and_open_page
end

When(/^I click on a particular "([^"]*)"$/) do |id|
	visit parkingspot_path(id)
end

Then(/^I should see available options for that "([^"]*)"$/) do |id|
	@spot = Parkingspot.find_by_id(id)
	expect(page).to have_content(@spot.id)
	expect(page).to have_content(@spot.status)
end
