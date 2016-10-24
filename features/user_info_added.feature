Feature: successful user registration

Scenario: After I register, my name and license plate should be added to a list of users
Given I am on the register page
When I enter a name and license plate and sign up
Then I should be sent to an account page
That displays the database of users including me
