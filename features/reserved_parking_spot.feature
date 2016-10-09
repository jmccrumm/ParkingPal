Feature: Reserved Parking Spot

Scenario: Attempting to take a spot that is already reserved
Given: The parking spot is reserved (yellow)
When: I click 'take spot'
Then: I should get a message telling me the spot is reserved and will be for __ more minutes