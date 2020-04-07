# README

* Ruby version 2.5.1

* Configuration
  you need to put your mysql user info in database.yml under /app/config
* Database creation
  run this commands in terminal:
  * bundle install
  * rails db:create
  * rails db:reset
  
* Database initialization
  * rails db:migrate
  * rails db:seed
* Run the application
  * Rails s
* How to run the test suite
  Run this commands:
  
   * rake db:reset RAILS_ENV=test
   * rake db:migrate RAILS_ENV=test
   * rake db:test:prepare
   * rake db:seed RAILS_ENV=test
   * bundle exec rspec
* Endpoints
  * Allow Users to Bid on certain Pet certain amount of money.
    * A post endpoint post /auctions/bid
    
    * body: {
	      "bid":
	      {
		      "bidder_id": "1",
		      "pet_id": "2",
		      "amount_of_money": "200"
	      }
      }
    
    * Response: {
                   "id": 1,
                   "bidder_id": 1,
                   "pet_owner_id": 1,
                   "pet_id": 2,
                   "amount_of_money": 200,
                   "created_at": "2020-04-07T04:18:06.789Z",
                   "updated_at": "2020-04-07T04:18:06.789Z"
               }
  
  * Allow pet owner to list all bids  
    * A get endpoint get /auctions/index?user[user_id]=x
    * Response:[
                   {
                       "id": 1,
                       "bidder_id": 1,
                       "pet_owner_id": 1,
                       "pet_id": 2,
                       "amount_of_money": 200,
                       "created_at": "2020-04-07T04:18:06.789Z",
                       "updated_at": "2020-04-07T04:18:06.789Z"
                   },
                   {
                       "id": 2,
                       "bidder_id": 1,
                       "pet_owner_id": 1,
                       "pet_id": 2,
                       "amount_of_money": 200,
                       "created_at": "2020-04-07T04:19:34.340Z",
                       "updated_at": "2020-04-07T04:19:34.340Z"
                   }]
  
  * Calculate the amount to be paid by the winner and the losing
    bidders
    * A get endpoint get /auctions/earnings
    * body {
	"items": 3,
	
	"participants": [
                { "name": "John Doe", "amount": "100" },
                { "name": "John Smith", "amount": "500" },
                { "name": "Sara Conor", "amount": "280" },
                { "name": "Martin Fowler", "amount": "320" }
              ]}
    * Response: {
                    "message": [
                        {
                            "name": "John Smith",
                            "paid": "320"
                        },
                        {
                            "name": "Martin Fowler",
                            "paid": "280"
                        },
                        {
                            "name": "Sara Conor",
                            "paid": "100"
                        },
                        {
                            "name": "John Doe",
                            "paid": "Lost"
                        }
                    ]
                }
}

* Also the app is deployed here
