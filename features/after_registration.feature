Feature: Able to login after registration

Scenario: After I sign up, I should be able to go back to the login page
Given I am on the account page
When I go back to home
Then I should be able to see the login/sign up form 
