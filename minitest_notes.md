# minitest

  minitest vs Rspec
    minitest is default included gem
    Rspec is a `Domain Specific Language` (DSL) for writing tests
    minitest can also use a DSL but can also be used to read like ruby code

  writing tests:

    - instance methods of test class in minitest must begin with `test_`
    - each test needs 1 or more assertions
    - focus on assert_equal(expected, actual)

    in addition to assert syntax, there is 'expectation' syntax or 'spec-sytle' syntax

      in expectation style, tests are grouped into `describe` blocks
      individual tests are written with the `it` method

    4 steps to writing tests:
     S 1) Set up the necessary objects.
     E 2) Execute the code against the object we're testing.
     A 3) Assert the results of the execution.
     T 4) Tear down and clean up any lingering artifacts.



# Vocab
  - Test suite
    "all of the tests for your project" the entire set of tests

  - Test
    a situation or context in which tests are run. e.g. a test is about making sure some error message is displayed when using the wrong password. A test can contain multiple assertions

  - Assertion
    The actual verification step to confirm that you are getting the expected output

