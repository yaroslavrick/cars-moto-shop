# Car advertisements web
[![Coverage](badge.svg)](https://github.com/yaroslavrick/car_advertisements_web)

[![codecov](https://codecov.io/github/codecov/example-ruby/branch/main/graph/badge.svg?token=478c35d8-0844-42ac-b478-d1fea7a21a58)](https://app.codecov.io/github/yaroslavrick/car_advertisements_web)

### Requirements

- Ruby 3.1.2
- Rails 7.0.4

#### 1. Clone the repository

```zsh
git@github.com:yaroslavrick/car_advertisements_web.git
cd car_advertisements_web
```

#### 2. Copy the .env.example file.

```zsh
cp .env.example .env
```

#### 3. Install dependencies

```zsh
bundle
```

#### 4. Create and setup the database

```zsh
rails db:create && rails db:migrate && rails db:seed
```

#### 5. Start the app

```zsh
rails s
```

Visit the app at localhost: http://localhost:3000

Visit the app at web: https://caradvertisementsweb-production.up.railway.app/
