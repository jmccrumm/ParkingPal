Feature: Login

Scenario: If you have registered, you can log into your account page which contains all the user information
Given I am on the login page
When I enter my login credintials
Then I should go to my account page and see all my information

Scenario: If you enter a password that is < 6 characters long, you should not be able to register
Given I am on the register page 
When I enter a password
Then it must be at least 6 characters long 

Scenario: If I enter any combination of symbols, chars, and numbers, the password should be accepted as valid
Given I am on the register page
When I enter a password
Then it will be accepted as long as it is a minimum of 6

Scenario: After I register, my name and license plate should be added to a list of users
Given I am on the register page
When I enter a name and license plate and sign up
Then I should be sent to an account page
That displays the database of users including me

Scenario: After I sign up, I should be able to go back to the login page
Given I am on the account page
When I go back to home
Then I should be able to see the login/sign up form 

Scenario: I am a registered user but cannot login
Given I am on the login page
When I enter valid credentials
Then nothing happens and I cannot login 
