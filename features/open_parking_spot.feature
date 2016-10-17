Feature: Open Parking Spot

Scenario: The status of the spot is open (green) AND (the type of spot is NOT handicap OR type of user IS handicap)
Given I am on the parkinglot page
When I click take "spot"
Then The status of the "spot" should become taken (red)
