#Rails.application.load_seed
Given(/^The status of the spot is open and spot is not handicap$/) do
	@spot = Parkingspot.where(status: 'open', spot_type: 'normal').take
	
	visit parkinglot_path(@spot.id)

end

Given(/^The user is not handicap$/) do
	@users = User.where(is_handicap: nil)
	@user = @users[0]
end

When(/^I click Take Spot$/) do
  @spot.status = 'taken'
  @spot.occupying = @user.id
  @spot.save!
end

Then(/^The status of the spot should become taken$/) do
  expect(@spot.status).to eq('taken')
end

Then(/^My name should be listed on that spot$/) do
  visit parkingspot_path(id: @spot.id)
  expect(page).to have_content(@user.name)
end


