# Welcome to AdoptDontShop!   
Rails project 

## Learning Goals

### Rails
* Implement RESTfulness and CRUD
* Implement partials to DRY code

### ActiveRecord 
* Demonstrate the use of ActiveRecord query calls to populate monolith with appropriate data 

### Databases 
* Understand one to many and many to many relational database techniques 
* Practice schema creation and model testing to enforce database requirements

### Contributors:
* Kelly Bard - @KellyBard
* Paul Debevec - @PaulDebevec

## Schema 
<img width="954" src='https://dbdiagram.io/embed/5e44a75d9e76504e0ef161b5'> 

## Setup

1. Rails setup.  
  * bundle install (occassionally removing the Gemfile.lock and running bundle may be most effective)
  * rails db:{drop, migrate, seed, create}
  * rake rails to run the test suite
  * rails s to run the server

2. This is currently hosted on Heroku
  * https://pk-adopt-dont-shop.herokuapp.com/

3. Install software dependencies
- Rails 5.1.x
- PostgreSQL

## Highlights

* 100% model and feature test coverave via simplecov.


## Pet adoption status

1. 'pending' status means a pet has an approved application on it.
2. Shelters with a pet who has a pending status may not be deleted.

