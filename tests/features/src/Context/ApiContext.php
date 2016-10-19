<?php
namespace Behat\Context;

use Behat\Gherkin\Node\PyStringNode;
use Behat\WebApiExtension\Context\WebApiContext;

/**
 * Defines application features from the specific context.
 */
class ApiContext extends WebApiContext
{
    /**
     * @Then /^(?:the )?response should be json:$/
     * @param PyStringNode $expected
     *
     * @throws \Exception
     */
    public function responseShouldBeJson(PyStringNode $expected)
    {
        //TODO: Improve that
        assert(json_encode(json_decode($expected)) === $this->response->getBody()->getContents());
    }
}
