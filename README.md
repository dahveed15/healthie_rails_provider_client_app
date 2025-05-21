# Provider-Client Journal App

This Rails app models a relationship between **Providers** (e.g., dietitians), their **Clients**, and **Journal Entries** written by those clients. Clients can be associated with multiple providers and have different plans for each one.

---

## Tech Stack

- Ruby on Rails
- SQLite3
- ActiveRecord

---

## Features

- Clients and Providers (with unique emails and names)
- Many-to-many relationship via `ClientProvider` join table (with plan type: basic or premium)
- Clients write journal entries (text content + timestamps)
- Query interfaces for:
  - Providers of a client
  - Clients of a provider
  - Client's journal entries (sorted by date)
  - All journal entries of a provider's clients (sorted by date)

---

## Setup Instructions

### 1. Clone the Repository

### 2. Install Ruby and Rails

Make sure you have:
- Ruby (install via rbenv or rvm)
- Bundler: `gem install bundler`
- Rails: `gem install rails`
- SQLite3: `brew install sqlite3` or `sudo apt install sqlite3`

### 3. Install Dependencies

- `bundle install`

### 4. Set up the Database (migrations, populate with seed data to test queries with)

- `rails db:create`
- `rails db:migrate`
- `rails db:seed`

### 5. Test Sample Queries in Rails console (rails c)

Refer to `schema.rb` and the model validations for `provider.rb`, `client.rb`, `client_provider.rb`, and `journal_entry.rb`.

- Find all clients for a particular provider
  - `Provider.find_by(email: "smith@health.com")&.clients`
- Find all providers for a particular client
  - `Client.find_by(email: "alice@example.com")&.providers`
- Find all of a particular client's journal entries, sorted by date posted
  - `Client.find_by(email: "alice@example.com")&.journal_entries&.order(created_at: :desc)`
- Find all of the journal entries of all of the clients of a particular provider, sorted by date posted
  - `JournalEntry.joins(client: :providers).where(providers: { email: "smith@health.com" }).order(created_at: :desc)`
