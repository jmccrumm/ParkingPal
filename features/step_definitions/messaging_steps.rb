Given(/^User is logged in$/) do
  visit user_path
	fill_in 'email', :with => 'email@email.com'
  	fill_in 'password', :with=> 'password'
  	click_button 'submit'
end

Given(/^A taken parking spot$/) do
	@spot = Parkingspot.where(:status => 'taken').take
  visit parkingspot_path(@spot.id)
end

When(/^I click the message icon$/) do
  visit message_new_path(@spot.occupying)
end

Then(/^I should see a text box to type arbitrary text in and send$/) do
  expect(page).to have_content('Body')
end
