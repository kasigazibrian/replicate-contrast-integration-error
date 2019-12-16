#### Test Contrast

Sample Application to recreate the exception thrown when using contrast-agent with factorybot

#### SetUp
* Clone the project `git clone https://github.com/kasigazibrian/replicate-contrast-integration-error.git`
* Run `bundle install`
* Create the DB by running `rake db:create`
* To run migrations for the Test DB.
* Run `RACK_ENV=test rake db:migrate`
 
 ####  To replicate the error: 
 ```
 $ rspec spec/controllers/likes_controller.rb`
 
 You will get this error 
 
 ```