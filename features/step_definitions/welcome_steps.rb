Given(/^there's a link titled "([^"]*)" with "([^"]*)" content$/) do |arg1, arg2|
  
end

When(/^I am on the welcomepage$/) do
  visit "/"
end

Then(/^I should see the "([^"]*)" link$/) do |arg1|
  page.should have_link(arg1);
end

