# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies
    - ruby and rails latest version 
    - mysql 

* Configuration
 - bundle install to install dependencies

* Database creation and initialization
    - rails db:setup
    - rails db:migrate
    - rails db:seed
    
* How to run the server
   - rails s

* Services (job queues, cache servers, search engines, etc.)
  - transaction services for create and calulating sum

* API Spec:
    - PUT /transactionservice/transaction1/$transaction_id.json { "amount":double,"type":string,"parent_id":long }
    - GET /transactionservice/transaction/$transaction_id.json Returns: { "amount":double,"type":string,"parent_id":long }
    - GET /transactionservice/types/$type.json Returns: [long, long, ... ] A json list of all transaction ids that share the same type $type.
    - GET /transactionservice/sum/$transaction_id.json Returns: { "sum": double } gets the sum of all childrens not just immediate childs


