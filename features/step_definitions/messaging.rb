Given(/^A parking spot$/) do
  visit parkinglot_path(@spot.id)
end

When(/^I click the message icon$/) do
  visit message_path
end

Then(/^I should see a text box to type arbitrary text in and send$/) do
  expect(page).to have_content(@message.box)
end
