# README

This README would normally document whatever steps are necessary to get the
application up and running.

This is a Ruby on Rails V6, Ruby 3, api for url shortener 

* Locally you will need mysql, here is a reference, https://gorails.com/setup/osx/11.0-big-sur

* To run you will need to have ruby 3.0.1 installed and also install bundler.  Then you will run `bundle` to install the Gems in the Gemfile.

* To run tests run `rspec`.

* You can run the server with `rails s`

* For the  development I did TDD with RSpec, I have a helper method `expired?` in the `UrlShortener` model to determine if the url is expired or not.  Other than that is very straight forward.
