class CreateSales < ActiveRecord::Migration[6.0]
  def change
    create_table :sales do |t|
      t.datetime :date
      t.references :product, null: false, foreign_key: true
      t.decimal :return_amount
      t.decimal :buy_price
      t.decimal :sell_price

      t.timestamps
    end
  end
end
