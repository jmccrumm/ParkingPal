Given(/^User is not signed in$/) do
  current_user = nil
end

Given(/^on an occupied spot$/) do
	@spot = Parkingspot.where(:status => 'taken').take
  visit parkinglot_path(@spot.id)
end

When(/^I click the messaging icon$/) do
  visit message_path(@spot.occupying)
end

Then(/^I do not see text box with input fields$/) do
  expect(page).to have_content('You need to sign in or sign up before continuing')
end
