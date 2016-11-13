Given(/^user is on compose message page$/) do
	visit message_new_path
end

When(/^user inputs email that is not connected to anyone$/) do
	fill_in 'recipient', :with => 'fake_email@email.com'
	fill_in 'subject', :with => 'whatevs'
	page.find('[@id=submit]').click
end

Then(/^an error message should show$/) do
	expect(page).to have_content("User does not exist")
end
