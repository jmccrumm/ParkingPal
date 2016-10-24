Feature: View User Account

Scenario: Displaying details of the user that is logged in

Given I am on the home page
When I am logged in with user id "1" and I click the account icon
Then I should see details of the user account as well as a button to edit info