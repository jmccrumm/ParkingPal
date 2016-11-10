Given(/^I'm on the signup page$/) do
  visit new_user_registration_path
end

When(/^I fill in ALL the fields$/) do
	fill_in 'name', :with => 'Daffy Duck'
	fill_in 'LPN', :with => 'LPN'
	fill_in 'email', :with => 'email@email.com'
	fill_in 'password', :with=> 'password'
	fill_in 'password_confirmation', :with => 'password'
end

When(/^click register$/) do
  click_button 'Sign up'
end

Then(/^I should get a page that displays my name, car type, plates \(ID\), and input my class schedule\.$/) do
  visit user_path
  # expect stuff
end
