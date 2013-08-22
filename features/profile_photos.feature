@javascript
Feature: show photos

  Background:
    Given following users exist:
      | username      | email               |
      | Bob Jones     | bob@bob.bob         |
      | Alice Smith   | alice@alice.alice   |
      | Robert Grimm  | robert@grimm.grimm  |
    And a user with email "bob@bob.bob" is connected with "robert@grimm.grimm"
    And I sign in as "robert@grimm.grimm" 

    Given I expand the publisher
    	And I have turned off jQuery effects
    	And I attach the file "spec/fixtures/button.png" to hidden "file" within "#file-upload"
    	And I press "Share"
    
    Scenario: see my own photos
      When I am on "robert@grimm.grimm"'s page 
      And I follow "View all" 
      Then I should be on "robert@grimm.grimm"'s photo page

		Scenario: I can see photos of a users who share with me on their profile page
			When I sign in as "bob@bob.bob"
			And I am on "robert@grimm.grimm"'s page 
			And I follow "View all" 
      Then I should be on "robert@grimm.grimm"'s photo page
    
    Scenario: I cannot see photos of people who don't share with me
      When I sign in as "alice@alice.alice"
      And I am on "robert@grimm.grimm"'s page
      Then I should not see "photos" within "div#profile"


