Feature: New Project

  As a ruby developer
  I want to be able to create project skeletons automatically
  So I don't have to waste time creating them manually

  Scenario: required directories are created
    When I run `elk project`
    Then the following directories should exist:
      | project             |
      | project/lib         |
      | project/lib/project |
      | project/spec        |

  Scenario Outline: empty files are created
    When I run `elk project`
    Then a file named "<file>" should exist

    Scenarios:
      | file                   |
      | project/lib/project.rb |
      | project/.gitignore     |

  Scenario Outline: files with content are created
    When I run `elk project`
    Then a file named "<file>" should exist
    And the file "<file>" should contain "<content>"

    Scenarios:
      | file                        | content                           |
      | project/Gemfile             | source 'https://rubygems.org'     |
      | project/spec/spec_helper.rb | require_relative '../lib/project' |
