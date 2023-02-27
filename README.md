# Car advertisements web
[![codecov](https://codecov.io/gh/yaroslavrick/car_advertisements_web/branch/development/graph/badge.svg?token=5ZHMKW9JZX)](https://codecov.io/gh/yaroslavrick/car_advertisements_web)
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
