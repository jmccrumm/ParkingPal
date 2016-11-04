Given(/^User is signed in$/) do
  #user_signed_in?
end

Given(/^on a parking spot$/) do
  visit parkinglot_path(@spot.id)
end

When(/^I click the messaging icon$/) do
  visit message_path
end

Then(/^I do not see text box with input fields$/) do
  expect(page).to_not have_content(@message.box)
end
