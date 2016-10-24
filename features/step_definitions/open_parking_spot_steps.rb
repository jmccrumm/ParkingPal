Given(/^The status of the spot is open and spot is not handicap$/) do
	Rails.application.load_seed
	@spots = Parkingspot.where(status: 'open', spot_type: 'normal')
end

Given(/^The user is not handicap$/) do
	@users = User.where(is_handicap: 'false')
end

When(/^I click Take Spot$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^The status of the spot should become taken$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^My name should be listed on that spot$/) do
  pending # Write code here that turns the phrase above into concrete actions
end


