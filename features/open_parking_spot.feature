Feature: Open Parking Spot

Scenario: Claiming an open spot

Given The status of the spot is open and spot is not handicap
And The user is not handicap
When I click Take Spot
Then The status of the spot should become taken
And My name should be listed on that spot
