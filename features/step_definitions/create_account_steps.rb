Given(/^I'm on the signup page$/) do
  visit new_user_registration_path
end

When(/^I fill in ALL the fields$/) do
	fill_in 'name', :with => 'New Person'
	fill_in 'LPN', :with => 'LPN-000'
	fill_in 'email', :with => 'newemail@email.com'
	fill_in 'password', :with=> 'password'
	fill_in 'password_confirmation', :with => 'password'
end

When(/^click register$/) do
  click_button 'Sign up'
end

Then(/^I should get a page that displays my name, email, and LPN$/) do
  visit user_path
  expect(page).to have_content("New Person")
  expect(page).to have_content("newemail@email.com")
  expect(page).to have_content("LPN-000")
end
