Feature: Cannot Message other user 

Scenario: Messaging a friend, but cannot. 

Given User is not signed in 
And on an occupied spot
When I click the message icon
Then I do not see text box with input fields