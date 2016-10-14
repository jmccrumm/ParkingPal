Feature: Welcome

Scenario: Viewing application's welcome page
Given there's a link titled "map" with "map" content
When I am on the welcomepage
Then I should see the "map" link

