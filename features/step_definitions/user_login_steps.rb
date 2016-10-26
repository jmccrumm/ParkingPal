Given(/^I am on the login page$/) do
  visit user_path
end

When(/^I enter my login credintials$/) do
  	fill_in 'email', :with => 'email@email.com'
  	fill_in 'password', :with=> 'password'
end

Then(/^I should go to my account page and see all my information$/) do
  click_button 'submit'
  visit user_path
end
