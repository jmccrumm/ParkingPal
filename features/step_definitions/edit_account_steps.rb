When(/^I am logged in with user id "([^"]*)"$/) do |id|
	visit user_path
	fill_in 'email', :with => 'email@email.com'
  	fill_in 'password', :with=> 'password'
  	click_button 'submit'

  	visit user_path
end

Then(/^I click edit info$/) do
	visit edit_user_registration_path
end

Then(/^I should see a form to change account information and a submit button$/) do
	expect(page).to have_content("Password")
	expect(page).to have_content("Name")
	expect(page).to have_content("Email")
	expect(page).to have_content("License plate number")
end

When(/^I change my name to "([^"]*)"$/) do |name|
	fill_in 'email', :with => 'email@email.com'
	fill_in 'name', :with => name
	fill_in 'current_password', :with => 'password'
	fill_in 'LPN', :with => '111 xxx'
end

When(/^I click submit$/) do
	click_button 'update'
end

When(/^I go back to the user account page$/) do
	post user_registration_path
  visit user_path
end

Then(/^my name should now say "([^"]*)"$/) do |name|
	expect(page).to have_content(name)
end