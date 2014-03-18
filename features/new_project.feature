Feature: New Project

  As a developer
  I want to be able to create project skeletons automatically
  So I don't have to waste time creating them manually

  Scenario: create top-level directory
    When I run `elk project`
    Then a directory named "project" should exist

  Scenario: create Gemfile
    When I run `elk project`
    Then a file named "project/Gemfile" should exist
    And the file "project/Gemfile" should contain "source 'https://rubygems.org'"
