Feature: Taken Parking Spot

Scenario: Viewing a taken spot to see when it will be open
Given: The spot is taken (red)
When: I click 'actions'
Then: I should have a list of options to see a countdown of when the spot will be open, mark the spot as open already, or message the user currently holding that spot