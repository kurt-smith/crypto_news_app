Open API Search Project
=========

*Note: This project is a work in progress*

Live demo available at https://open-api-search.herokuapp.com/

---

This project is a Ruby on Rails demo of interacting with a public Cryptocurreny News API and displaying trending coin news to the end user. The following features have been implemented:

- Create a page where a public user can do a keyword search and view results

- A sidebar that shows past searches anyone has done, with a count of how many times it has been run

 - Search history only shows unique searches
 - Search history is sortable by date/count/search term
 - Performing a search displays past information about that search (list of all the previous times that term was searched)

- Clicking on a past search should run it again

#### Ruby 2.4.4
#### Rails 5.1.6

### Dependencies

This service has dependencies on the following services:

1. Ruby `2.4.4`
1. MongoDB
1. Redis
1. Sidekiq

### Docker
Follow the Docker [Getting Started](https://docs.docker.com/get-started/) guide to get `docker` and `docker-compose`.  This project contains helper scripts to build and test services.

1. Run the test suite: `$ script/test`

#### Local development
To start the application using docker compose locally:

1. Start the services: `$ docker-compose up --build`
1. Access via browser: `$ open http://localhost:3000`

### Local development (without Docker)
To start the application from project folder:

1. Start Redis: `$ redis-server`
1. Start Sidekiq: `$ bundle exec sidekiq`
1. Start App: `$ rails s`
1. Access via browser: `$ open http://localhost:3000`

### Database

MongoDB was used in order to store third-party API responses in the collections.

#### Setup

1. `docker-compose run app rake db:mongoid:create_indexes` (Docker)
1. `db:mongoid:create_indexes` (Local)

### Environment Variables

| Variable       |  Description   | Default                 |
| ---------------|:---------------|:-----------------------:|
| `MONGODB_URI`  | MongoDB URI   | mongodb://localhost:27017/crypto_news_development |
| `REDIS_CACHE_URL`  | Redis Cache URL (NOT USED CURRENTLY) | redis://localhost:6379/0 |
| `REDIS_WORKER_URL`  | Redis Worker URL (NOT USED CURRENTLY) | redis://localhost:6379/1 |
| `DB_MAX_CONNECTIONS`  | Mongo Max Connections  | 16 |
| `DB_MIN_CONNECTIONS`  | Mongo Min Connections | 5 |
| `DB_WAIT_QUEUE_TIMEOUT`  | DB Queue Timeout  | 5 |
| `DB_CONNECT_TIMEOUT`  | DB Connection Timeout  | 10 |
| `DB_SOCKET_TIMEOUT`  | DB Socket Timeout | 5 |
| `CRYPTO_CONTROL_API_KEY`  | Crypto Control Api Key | - |

### Future Considerations

1. DB Indexes on Search#keywords for faster queries and to not query the whole DB for each request
1. Cache external results so the API is not being hit every request
1. Autocomplete for Search feature to prevent invalid search terms from occurring
1. Test frequency of new articles to determine if scheduled jobs for popular search terms are beneficial
1. Search may not need the results saved. Storage can be reduced greatly if not needed

### Tradeoffs

1. Specs: Due to time constraints, I decided to forgo testing the UI portion. Requests have been tested, but more detailed testing should be added.
1. Design.. I used this opportunity to test out the Materialize front-end component library and didn't get a chance to do a deep dive of the design components.
