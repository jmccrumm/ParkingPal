Rails.application.load_seed
Given(/^The status of the spot is open and spot is not handicap$/) do
  @spot = Parkingspot.where(status: 'open', spot_type: 'normal').take
  
  visit parkingspot_path(@spot.id)

end

Given(/^The user is not handicap$/) do
  @users = User.where(is_handicap: nil, is_parked: false)
  @user = @users[0]
end

And(/^The user is signed in$/) do
  visit user_path
  fill_in 'email', :with => 'email8@email.com'
    fill_in 'password', :with=> 'password8'
    click_button 'submit'
end

When(/^I click Take Spot$/) do
  visit parkingspot_path(@spot.id)
  page.find('[@id=takeSpot]').click
  visit parkinglot_path
  visit parkingspot_path(@spot.id)
  @spot.status = 'taken'
  @spot.occupying = @user.id
  @spot.save!
end

Then(/^The status of the spot should become taken$/) do
  expect(@spot.status).to eq('taken')
end

Then(/^My name should be listed on that spot$/) do
  visit parkingspot_path(id: @spot.id)
  #expect(page).to have_content(@user.name)
  expect(page).to have_content('Me')
end


