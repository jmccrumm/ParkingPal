Feature: Parking Lot

Scenario: Viewing the list of parking spots within a lot
Given The grid of parking spots are being shown
When I click on a particular spot with id "1"
Then I should see available options for spot with id "1"
