# README



## Dinner Party

This prototype is [hosted](https://dinner-party-16003.herokuapp.com/) at heroku.



## Operation

1. Access https://dinner-party-16003.herokuapp.com/
2. Input a comma-separated list of ingredients
3. Click `Search`



## User Stories



As the host of a dinner party, I want to know what dishes can I cook given the ingredients I currently have in my fridge.



As the host of a dinner party, I want to know if the ingredients I currently have in my fridge offer me appropriate options for the menu or if I need to go to the market.


## Database Diagram

![db-diagram](https://user-images.githubusercontent.com/605980/137990767-c1822c0a-fb55-46c8-95bf-4b6370a6547a.png)


## Stack

This prototype was developed using the following technologies:

- PostgreSQL 14.0
- ruby 3.0.2
- rails 6.1.4
- webpacker 5.4.3
- React 17.0.2
- Bootstrap 5.1.3



## Self-hosting this prototype

1. Install [PostgreSQL](https://www.postgresql.org/docs/release/)

2. Install [ruby](https://www.ruby-lang.org/en/downloads/releases/) 3.0.2

3. Get the source code with:

   ```bash
   git clone git@github.com:mguinada/dinner-party.git
   ```

4. Bundle the dependencies with:

   ```bash
   bundle install
   rails  webpacker:install
   ```

5. Create and migrate the database with:

   ```bash
   bundle exec rails db:create
   bundle exec rails db:migrate
   ```

6. Seed the database with:

   ```bash
   bundle exec rails db:seed
   ```

7. Start the server with:

   ```bash
   bundle exec rails s
   ```
