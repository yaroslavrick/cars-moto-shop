# Car advertisements web

## Screenshots:

- cars list
<img width="3018" height="1600" alt="image" src="https://github.com/user-attachments/assets/4498c63e-6548-44d5-acb1-47679a241c26" />

- filters
<img width="3018" height="1600" alt="image" src="https://github.com/user-attachments/assets/fed81b31-5bdf-44e9-b9d3-cc52e70e52f8" />

- my searches:
<img width="3018" height="1600" alt="image" src="https://github.com/user-attachments/assets/4614c19d-1be3-466a-90d0-aa32f5351b57" />

- Search page:
<img width="3018" height="1600" alt="image" src="https://github.com/user-attachments/assets/8ad4846b-ff25-4635-90ae-b5eba29b35ae" />

- Login page:
<img width="3018" height="1600" alt="image" src="https://github.com/user-attachments/assets/2292940b-7a91-433d-83f3-5d144d6113e2" />

### Requirements

- Ruby 3.1.2
- Rails 7.0.4

#### 1. Clone the repository

```zsh
git@github.com:yaroslavrick/car_advertisements_web.git
```

#### 2. Move into the project directory:

```bash
cd car_advertisements_web
```

#### 3. Install dependencies

```zsh
bundle install
```

#### 4. Copy the .env.example file.

```zsh
cp .env.example .env.development
```

#### 5. Setup Docker services (PostgreSQL and Redis):

```zsh
docker-compose up
```

Ensure that the ports configured in `.env` do not conflict with your running services.


#### 6. Create the database:

```bash
bundle exec rails db:create
```

#### 7. Run database migrations:

```bash
bundle exec rails db:migrate
```

#### 8. (Optional) Run seed data to create some sample data:

```bash
bundle exec rails db:seed
```

## Usage

To start the app, run the following command:

```bash
bundle exec rails server
```

Once the server is running, open your web browser and go to http://localhost:3000 to access the app.

## Testing

To run the test suite, use the following command:

```bash
bundle exec rspec
```
