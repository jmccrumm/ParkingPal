Feature: Edit User Account

Scenario: Displaying details of the user that is logged in
Given I am on the home page
When I click the account icon
Then I should see details of the user account as well as a button to edit info
When I click edit info
Then I should see a form to change account information and a submit button
When I change my name to "Average Joe" 
And I click submit
And I go back to the user account page
Then my name should now say "Average Joe"