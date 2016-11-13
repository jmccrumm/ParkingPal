Given(/^user is on compose message page$/) do
	visit user_path
	fill_in 'email', :with => 'email@email.com'
  	fill_in 'password', :with=> 'password'
  	click_button 'submit'

	visit message_new_path
end

When(/^user inputs email that is not connected to anyone$/) do
	fill_in 'recipient_', :with => 'fake_email@email.com'
	fill_in 'subject_', :with => 'whatevs'
	fill_in 'body_', :with => 'something'
	click_button 'submit'
end

Then(/^an error message should show$/) do
	expect(page).to have_content("User does not exist")
end
