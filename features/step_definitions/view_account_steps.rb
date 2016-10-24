Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I am logged in with user id "([^"]*)" and I click the account icon$/) do |id|
  @user = User.find(id)
  visit account_path(@user.id)
end

Then(/^I should see details of the user account as well as a button to edit info$/) do
  expect(page).to have_content(@user.name)
  expect(page).to have_content(@user.LPN)
  # expect user's schedule to be displayed
  # expect there to be an "edit account" button
end
