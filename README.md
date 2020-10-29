## Database

### Migration setup

`rails g scaffold product code:string:uniq:not_null definition`

`rails g scaffold sales date:datetime product:references return_amount:decimal buy_price:decimal sell_price:decimal`

`rails g model payments kind bank comission:decimal sale:references`

`rails g scaffold invoices invoice_number:integer pen_number:integer quantity:integer tax_kdv:decimal tax_otv:decimal definition value_date:date sum:decimal product_code:string:not_null invoice_date:date`

`rails g model Category kind definition order_in_kind:integer`

`rails g model Categoryings category:references product:references`

`rails g model Outstanding product:references value:integer`

### Generate boilerplate configuration files for RSpec

`rails generate rspec:install`

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
