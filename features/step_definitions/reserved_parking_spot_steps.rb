Given(/^The parking spot is reserved$/) do
	Rails.application.load_seed
	@spots = Parkingspot.where(status: 'reserved')
end

Given(/^I am not the user currently holding the spot$/) do
	@user = User.create!(name: 'fake_user', LPN: '123 xyz')
end

When(/^I view the options for that spot$/) do
	@spots.each do |spot|
		visit parkingspot_path(spot.id)
	end
end

Then(/^I should not be able to take the spot$/) do
	expect(page).not_to have_content('Take Spot')
end


