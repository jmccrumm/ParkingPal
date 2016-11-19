Given(/^I am on the account page$/) do
	visit user_path
end

Given(/^I am not logged in$/) do
  new_user_session = nil 

end

When(/^I click sign up$/) do
  click_link('Sign up')
end

Then(/^I should see a form that asks for full name, lpn, email, password$/) do
  visit new_user_registration_path
  expect(page).to have_content("Name")
  expect(page).to have_content("License plate number")
  expect(page).to have_content("Email")
  expect(page).to have_content("Password")
end
