Feature: RESTful paradigm check
  In order to interact with RESTful API
  As a user-agent
  The service needs to respond in a RESTful manner

  We interact with the allegedly RESTful API with a domain object: notes
    GET  ->   http://localhost:9001/api/v1/notes
    GET  ->   http://localhost:9001/api/v1/notes/{id}
    POST ->   http://localhost:9001/api/v1/notes
    PUT ->   http://localhost:9001/api/v1/notes/{id}
    DELETE -> http://localhost:9001/api/v1/notes/{id}

  Background:
    Given the fixture notes are in database

  Scenario: Getting an existing note
    When I send a GET request to "notes/2"
    Then the response code should be 200
    And the response should be json:
    """
    {
      "id": "2",
      "note": "two"
    }
    """

  @restless
  Scenario: Getting a not existing note
    When I send a GET request to "notes/100000"
    Then the response code should be 404

  @restless
  Scenario: Getting an existing note with different Accept header
    Given I set header "Accept" with value "text/html"
    When I send a GET request to "notes/1"
    Then the response code should be 406

  @wip @restless
  #TODO
  Scenario: Getting an existing note returns application/json content type

  Scenario: Getting notes collection
    When I send a GET request to "notes"
    Then the response code should be 200
    And the response should contain json:
    """
    [
      {
        "id": "1",
        "note": "one"
      },
      {
        "id": "2",
        "note": "two"
      },
      {
        "id": "3",
        "note": "three"
      }
    ]
    """

  Scenario: Getting notes collection when it is empty
    Given there are no notes
    When I send a GET request to "notes"
    Then the response code should be 200
    And the response should be json:
    """
    []
    """
