Feature: Merge Articles
  As admin
  I want to merge to articles in one
  Because I wanna keep similiar contant in one place

  Background:
    Given the blog is set up
  Scenario: A non-admin can not merge articles
    Given I am logged as nonadmin with password "12345678"
    And the following articles exist:
    | title           | body                                    | author    | guid  |
    | Hello world     | Lorem ipsum                             | nonadmin  | asd-aa|
    When I am on "Hello world" edit content page
    Then I should see "Hello world"
    And I should not see "Merge Articles"
    And I should not see button "Merge"

  Scenario: When articles are merged, the merged article should contain the text of both previous articles
    Given the following articles exist:
    | title           | body                                    | author    | guid  |
    | Hello world     | Lorem ipsum                             | nonadmin  | dfd-sd|
    | Hello new world | Vestibulum fringilla elementum commodo  | nonadmin  | sds-2s|
    And I am logged into the admin panel
    When I am on "Hello world" edit content page
    And I feel in "merge_with" with "Hello new world" article id
    When I press "Merge"
    Then I should be on "Hello world" edit content page
    When I go to the home page
    Then I should see "Hello world"
    When I follow "Hello world"
    Then I should see "Lorem ipsum"
    And I should see "Vestibulum fringilla elementum commodo"
