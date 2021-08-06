Kabulchat
======================
Ryby on Rails Web application with Aplication Cable technology for chat with other users. You can join to already existing chatroom or create your own.
### Link: https://kabulchat.herokuapp.com/
----------------------
## Configuration

+ Rails versin: 5.1.4
+ Bootstrap 4
+ `coffee-rails` gem
+ Redis + `redis` gem
+ PostgreSQL (for production)
+ 3 channels: `Room`, `Status` and `Presence`
+ Language: en

## Installation

1. Clone the repo.
2. Execute 
```
$ bundle install
```
3. Execute 
```
$ rails db:migrate
```
4. Figure out your Redis URL for production:
```
$ heroku addons:add redistogo
```
You will get `redis://redistogo:.../`, copy that to the `.env` file for the `REDISTOGO_URL` parameter
5. Adjust `config.action_cable.url` and `config.action_cable.allowed_request_origins` in `config/environments/production.rb` file with your Heroku app URL
6. And don't forget make new commits and push app to your GitHub and Heroku again
