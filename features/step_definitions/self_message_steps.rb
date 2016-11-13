Given(/^I am on the compose message page$/) do
	visit user_path
	fill_in 'email', :with => 'email@email.com'
  	fill_in 'password', :with=> 'password'
  	click_button 'submit'

	visit message_new_path
end

When(/^I enter my own email$/) do
	fill_in 'recipient_', :with=> 'email@email.com'
end

When(/^I enter "([^"]*)" in the subject line$/) do |subject|
	fill_in 'subject_', :with=> subject
	fill_in 'body_', :with=> 'anything'
end

When(/^I click send$/) do
	page.find('[@id=submit]').click
end

Then(/^I should see my inbox with a message with the subject "([^"]*)"$/) do |subject|
	post message_compose_path
	visit message_path
	expect(page).to have_content(subject)
end