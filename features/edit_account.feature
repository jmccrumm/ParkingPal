Feature: Edit User Info

Scenario: Changing the name of the user logged in

When I am logged in with user id "1" 
And I click edit info
Then I should see a form to change account information and a submit button
When I change my name to "Average Joe" 
And I click submit
And I go back to the user account page
Then my name should now say "Average Joe"