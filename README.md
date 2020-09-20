<<<<<<< Updated upstream
# transactions
Framework: RoR

Database: MySql

setup
- bundle install
- rails db:setup
- rails db:migrate
- rails db:seed
- rails s to start the server


API Spec: <br>
- PUT /transactionservice/transaction1/$transaction_id.json { "amount":double,"type":string,"parent_id":long }
- GET /transactionservice/transaction/$transaction_id.json Returns: { "amount":double,"type":string,"parent_id":long }
- GET /transactionservice/types/$type.json Returns: [long, long, ... ] A json list of all transaction ids that share the same type $type.
- GET /transactionservice/sum/$transaction_id.json Returns: { "sum": double } gets the sum of all childrens not just immediate childs
=======
# README

This README would normally document whatever steps are necessary to get the
application up and running.

Things you may want to cover:

* Ruby version

* System dependencies

* Configuration

* Database creation

* Database initialization

* How to run the test suite

* Services (job queues, cache servers, search engines, etc.)

* Deployment instructions

* ...
>>>>>>> Stashed changes
