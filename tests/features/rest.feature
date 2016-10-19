Feature: RESTful paradigm check
  In order to interact with RESTful API
  As a user-agent
  The service needs to respond in a RESTful manner

  We interact with the allegedly RESTful API with a domain object: notes

  We interact with the allegedly RESTful API with a domain object: notes
  GET  ->   http://localhost:9001/api/v1/notes
  GET  ->   http://localhost:9001/api/v1/notes/{id}
  POST ->   http://localhost:9001/api/v1/notes
  PUT ->   http://localhost:9001/api/v1/notes/{id}
  DELETE -> http://localhost:9001/api/v1/notes/{id}

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

  @wip @restless
  Scenario: Getting a not existing note
    When I send a GET request to "notes/100000"
    Then the response code should be 404

  @wip @restless
  Scenario: Getting an existing note with different Accept header

  @wip @restless
  #TODO
  Scenario: Getting an existing note returns application/json content type

  @wip
  Scenario: Getting notes collection
    When I send a GET request to "notes"
    And print response
    Then the response code should be 200
    And the response should contain json:
    """
    [{"id":"1","note":"one"},{"id":"2","note":"two"},{"id":"3","note":"three"}]
    """

  @wip
  Scenario: Getting notes collection when it is empty
