Rails.application.load_seed
Given(/^The status of the spot is open and spot is not handicap$/) do
  @spot = Parkingspot.where(status: 'open', spot_type: 'normal').take
  
  visit parkingspot_path(@spot.id)

end

Given(/^The user is not handicap$/) do
  @users = User.where(is_handicap: nil)
  @user = @users[0]
end

And(/^The user is signed in$/) do
  visit new_user_session_path
  fill_in 'email', :with => 'email@email.com'
  fill_in 'password', :with=> 'password'
  click_button "Log in"
  @user = User.find(current_user)
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
  visit parkingspot_path(id: @user.id)
  #expect(page).to have_content(@user.name)
  expect(page).to have_content('Me')
end


