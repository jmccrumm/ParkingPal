Given(/^User is logged in$/) do
  current_user = User.find(1)
end

Given(/^A taken parking spot$/) do
	@spot = Parkingspot.where(:status => 'taken').take
  visit parkingspot_path(@spot.id)
end

When(/^I click the message icon$/) do
  visit message_path(@spot.occupying)
end

Then(/^I should see a text box to type arbitrary text in and send$/) do
  expect(page).to have_content('[@id=message]')
end
