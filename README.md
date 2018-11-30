# Rails Amusement Park
This is my personal take on the Original Lab by Flatiron called: Flatiron Amusement Park.

I'm building a more feature rich application using the original App domain as inspiration.

## Objectives

Get comfortable with using form helpers, having models interact with each other, and build out a
user authenticate and authorize system using 'sessions' and 'bcrypt'.

## Usage
The App domain is an amusement park. There will be users, attractions, and users can take rides on attractions.

Ride is the join table between the models User and Attraction.

Using bcrypt gem and the supporting has_secure_password macro the app has uses sessions to
login and signup users. Admin permission can be set during signup and will allow access to
additional features, like editing an Attractions attributes, and updating User information.

## Instructions
`bundle install`
`rails db:migrate`
`rails db:seed`

# To launch application
`rails server`
Visit the url `localhost:3000`

# To Test Application with RSpec
to execute all tests use:
`rspec`

to execute model tests user:
`rspec spec/models/#{model_name}_spec.rb`

to execute feature tests:
`rspec spec/features/users_features_spec.rb`

## Resources
* [Rails Generators](http://guides.rubyonrails.org/generators.html)
* [Form Helpers](http://api.rubyonrails.org/classes/ActionView/Helpers/FormHelper.html)
* [Form Helpers Guide](http://guides.rubyonrails.org/form_helpers.html)
* [Collection Select](http://stackoverflow.com/questions/8907867/can-someone-explain-collection-select-to-me-in-clear-simple-terms)
* [Sessions in Rails](http://guides.rubyonrails.org/security.html#sessions)
* [`has_secure_password`](http://api.rubyonrails.org/classes/ActiveModel/SecurePassword/ClassMethods.html)

<p data-visibility='hidden'>View <a href='https://learn.co/lessons/rails-amusement-park' title='Rails Amusement Park'>Rails Amusement Park</a> on Learn.co and start learning to code for free.</p>
