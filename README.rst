================================================================================
In and Out Board
================================================================================

Welcome! This is an application that simulates the in and out board for a team. 
Users can signup, change their status (with a message if they are out), and view the statuses of all the other members. 

Features
================================================================================

* Easy to use board with clear indication of status and displaying of 'out' message
* Automatic refresh of board every 10 seconds without reloading the entire page
* One click to change own status
* Users are sorted alphabetically
* Activity log - status changes are logged and each user has access to their own history

Application Information
================================================================================

* Rails version 3.2.11
* Twitter bootstrap for the look and feel
* SQLite for development and PostgreSQL in production, MySQL should simply work with a change in Gemfile. 
* Devise for authentication
* jQuery for JS/AJAX support
* Rspec / Spork / FactoryGirl / Capybara for testing: all tests are in the /spec folder. bundle exec rspec spec/ to run all.  