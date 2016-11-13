Given(/^I am on the compose message page$/) do
	visit message_new_path
end

When(/^I enter my own email$/) do
	fill_in 'recipient', :with=> current_user.email
end

When(/^I enter "([^"]*)" in the subject line$/) do |subject|
	fill_in 'subject', :with=> subject
end

When(/^I click send$/) do
	page.find('[@id=submit]').click
end

Then(/^I should see my inbox with a message with the subject "([^"]*)"$/) do |subject|
	expect(page).to have_content(subject)
end