Given(/^I am on the home page$/) do
  visit root_path
end

When(/^I click the account icon$/) do
  visit account_path
end

Then(/^I should see details of the user account as well as a button to edit info$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click edit info$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

Then(/^I should see a form to change account information and a submit button$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I change my name to "([^"]*)"$/) do |name|
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click submit$/) do
  pending # Write code here that turns the phrase above into concrete actions
end

When(/^I go back to the user account page$/) do
  visit account_path
end

Then(/^my name should now say "([^"]*)"$/) do |name|
  pending # Write code here that turns the phrase above into concrete actions
end
