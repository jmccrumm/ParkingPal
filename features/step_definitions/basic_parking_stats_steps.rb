Given(/^The parking lot spot total$/) do
  #pending # Write code here that turns the phrase above into concrete actions
end

When(/^I click "([^"]*)"$/) do |arg1|
	visit stats_path
end

Then(/^I should get a total back of spots that are Available \(green\), reserved \(yellow\), and taken \(red\)\.$/) do
	expect(page).to have_content(Parkingspot.count('id'))
	expect(page).to have_content(Parkingspot.where(status: 'open').count('id'))
	expect(page).to have_content(Parkingspot.where(status: 'taken').count('id'))
	expect(page).to have_content(Parkingspot.where(status: 'reserved').count('id'))
end

