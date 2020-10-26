class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.datetime :date
      t.references :product, null: false, foreign_key: true
      t.decimal :return_amount, precision: 20, scale: 2
      t.decimal :buy_price, precision: 20, scale: 2, null: false
      t.decimal :sell_price, precision: 20, scale: 2, null: false

      t.timestamps
    end
  end
end
