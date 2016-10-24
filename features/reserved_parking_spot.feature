Feature: Reserved Parking Spot

Scenario: Attempting to take a spot that is already reserved

Given The parking spot is reserved
And I am not the user currently holding the spot
When I view the options for that spot
Then I should not be able to take the spot
