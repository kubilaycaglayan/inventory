## Database

`rails g scaffold product code:string:uniq:not_null definition`

`rails g scaffold sales date:datetime product:references return_amount:decimal buy_price:decimal sell_price:decimal`

`rails g model payments type bank comission:decimal sales:references`

### RAILS & REACT TEMPLATE

> Ready to deploy Heroku, Rails and React setup.

### Webpacker

- Activated with this command:
- `bundle exec rails webpacker:install:react`

https://github.com/rails/webpacker/blob/master/docs/integrations.md#react

### Routes

```ruby
  Rails.application.routes.draw do
    root 'pages#index'

    get '*path', to: 'pages#index', via: :all
  end
```

### Linters

- React linter activated for `/app/javascript` folder only.

### Tests

- `npm test`
