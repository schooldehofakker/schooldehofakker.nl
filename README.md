# schooldehofakker.nl

Publieke website van School de Hofakker

![Screenshot van de website](website.png)

![Ci](https://github.com/schooldehofakker/schooldehofakker.nl/workflows/Ci/badge.svg?branch=develop)
[![GitHub issues open](https://img.shields.io/github/issues/network-tools/shconfparser.svg)](https://github.com/schooldehofakker/schooldehofakker.nl/issues)
[![Dependabot Status](https://api.dependabot.com/badges/status?host=github\&repo=schooldehofakker/schooldehofakker.nl\&identifier=176970982)](https://dependabot.com) <a href="https://www.ruby-lang.org/en/"> <img src="https://img.shields.io/badge/Ruby-v2.6.6-brightgreen.svg" alt="ruby version"> </a> <a href="http://rubyonrails.org/"> <img src="https://img.shields.io/badge/Rails-v6.0.3-brightgreen.svg" alt="rails version"> </a>

## Data model

![Erd](erd.png)

## Getting started

*   Install [dip](https://github.com/bibendi/dip)
*   Install [docker](https://docs.docker.com/install/)
*   Install [docker-compose](https://docs.docker.com/compose/install/)

## Contributing

We encourage you to contribute to schooldehofakker.nl! Please check out the
[Contributing to schooldehofakker guide](CONTRIBUTING.md) for guidelines about how to proceed.

## Checkout the code

```shell
git clone https://github.com/schooldehofakker/schooldehofakker.nl.git
cd schooldehofakker.nl
dip provision
dip rails s
dip rubocop
dip rspec
```

## Deploy

Once you're ready to deploy to [Heroku](https://www.heroku.com), run:

```shell
heroku apps:create
heroku buildpacks:add heroku/ruby --index 2
git push heroku master
heroku run rake db:seed
heroku open
```

Or you can click this button to deploy straight to Heroku from this repository:

[![Deploy](https://www.herokucdn.com/deploy/button.svg)](https://heroku.com/deploy)

Success, live long and prosper!

## Suggestions, problems, typos?

Get in touch by adding an [issue](https://github.com/schooldehofakker/schooldehofakker.nl/issues).
