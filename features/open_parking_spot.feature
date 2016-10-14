Feature: Open Parking Spot

Scenario: Changing the status of a spot from open to taken
Given The status of the spot is open (green) AND (the type of spot is NOT handicap OR type of user IS handicap)
When I click take "spot"
Then The status of the "spot" should become taken (red)
