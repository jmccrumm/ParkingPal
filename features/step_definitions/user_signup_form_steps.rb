Given(/^I am on the account page$/) do
	visit user_path
end

Given(/^I am not logged in$/) do
  new_user_session = nil 

end

When(/^I click sign up$/) do
  click_link('Sign up')
end

Then(/^I should see a form that asks for full name, lpn, email, password, schedule$/) do
  visit new_user_registration_path
  # expect stuff
end
