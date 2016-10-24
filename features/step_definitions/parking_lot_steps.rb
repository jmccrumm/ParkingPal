Given(/^The grid of parking spots are being shown$/) do
	Rails.application.load_seed
	@mainlot = Parkinglot.find(1)
	visit parkinglot_path(@mainlot)
end

When(/^I click on a particular spot with id "([^"]*)"$/) do |id|
	@spot = Parkingspot.find(id)
	visit parkingspot_path(@spot.id)
end

Then(/^I should see available options for spot with id "([^"]*)"$/) do |id|
	expect(page).to have_content(@spot.id)
	expect(page).to have_content(@spot.status)
end
