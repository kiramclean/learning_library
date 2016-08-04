[![CircleCI](https://circleci.com/gh/kiramclean/learning_library/tree/master.svg?style=shield)](https://circleci.com/gh/kiramclean/learning_library/tree/master)
[![codecov](https://codecov.io/gh/kiramclean/learning_library/branch/master/graph/badge.svg)](https://codecov.io/gh/kiramclean/learning_library)
[![Code Climate](https://codeclimate.com/github/kiramclean/learning_library/badges/gpa.svg)](https://codeclimate.com/github/kiramclean/learning_library)
[![Dependency Status](https://gemnasium.com/badges/github.com/kiramclean/learning_library.svg)](https://gemnasium.com/github.com/kiramclean/learning_library)

# Learning library

## Getting Started

After you have cloned this repo, run this setup script to set up your machine
with the necessary dependencies to run and test this app:

    % ./bin/setup

It assumes you have a machine equipped with Ruby, Postgres, etc. If not, set up
your machine with [this script].

[this script]: https://github.com/thoughtbot/laptop

After setting up, you can run the application using [Heroku Local]:

    % heroku local

[Heroku Local]: https://devcenter.heroku.com/articles/heroku-local

## Guidelines

Use the following guides for getting things done, programming well, and
programming in style.

* [Protocol](http://github.com/thoughtbot/guides/blob/master/protocol)
* [Best Practices](http://github.com/thoughtbot/guides/blob/master/best-practices)
* [Style](http://github.com/thoughtbot/guides/blob/master/style)

## Deploying

If you have previously run the `./bin/setup` script,
you can deploy to staging and production with:

    $ ./bin/deploy staging
    $ ./bin/deploy production
