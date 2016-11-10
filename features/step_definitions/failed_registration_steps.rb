Given(/^I am on the register page$/) do
	current_user = nil
	visit new_user_registration_path
end

When(/^I don't enter a password$/) do
	page.find('[@id=password]')
	fill_in 'password', :with=> ''
	fill_in 'password_confirmation', :with => ''
end

When(/^I click Sign up$/) do
	page.find('[@id=submit]').click
end

Then(/^I should recieve an error$/) do
	expect(page).to have_content('Password can\'t be blank')
end
