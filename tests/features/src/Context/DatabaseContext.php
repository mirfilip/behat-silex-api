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
     * @var string
     */
    private $projectRoot;
    /**
     * @var string
     */
    private $dbPath;

    public function __construct()
    {
        $this->projectRoot = realpath(__DIR__ . '/../../../../');
        $this->dbPath = $this->projectRoot . '/app.db';
    }

    /**
     * @Given there are no notes
     */
    public function truncateDatabase()
    {
        $truncateCommand = $this->projectRoot . '/resources/sql/truncate.sql';
        @exec('sqlite3 ' . $this->dbPath . "< $truncateCommand");
    }

    /**
     * @Given the fixture notes are in database
     */
    public function setupDatabase()
    {
        @exec('rm -f ' . $this->dbPath);
        $truncateCommand = $this->projectRoot . '/resources/sql/schema.sql';
        @exec('sqlite3 ' . $this->dbPath . "< $truncateCommand");
    }
}
