<?php
namespace Behat\Context;
use Behat\Behat\Context\Context;

/**
 * Class DatabaseContext
 *
 * @package Behat\Context
 */
class DatabaseContext implements Context
{
    /**
     * @Given there are no notes
     */
    public function truncateDatabase()
    {
        $truncateCommand = __DIR__ . '/truncate.sql';
        @exec("sqlite3 app.db < $truncateCommand");
    }

    /**
     * @Given the fixture notes are in database
     */
    public function setupDatabase()
    {
        @exec("rm app.db");
        $truncateCommand = __DIR__ . '/schema.sql';
        @exec("sqlite3 app.db < $truncateCommand");
    }
}
