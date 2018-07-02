Open API Search Project
=========

A single page Ruby on Rails app that allows a user to do a keyword search and view results.

*Note: This project is a work in progress*

#### Ruby 2.4.4
#### Rails 5.1.6

### Dependencies

This service has dependencies on the following services:

1. Ruby `2.4.4`
1. MongoDB
1. Redis
1. Sidekiq

### Environment Variables

| Variable       |  Description   | Default                 |
| ---------------|:---------------|:-----------------------:|
| `MONGODB_URI`  | MongoDB URI   | mongodb://localhost:27017/crypto_news_development |
| `REDIS_CACHE_URL`  | Redis Cache URL   | redis://localhost:6379/0 |
| `REDIS_WORKER_URL`  | Redis Worker URL  | redis://localhost:6379/1 |
| `DB_MAX_CONNECTIONS`  | Mongo Max Connections  | 16 |
| `DB_MIN_CONNECTIONS`  | Mongo Min Connections | 5 |
| `DB_WAIT_QUEUE_TIMEOUT`  | DB Queue Timeout  | 5 |
| `DB_CONNECT_TIMEOUT`  | DB Connection Timeout  | 10 |
| `DB_SOCKET_TIMEOUT`  | DB Socket Timeout | 5 |

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
