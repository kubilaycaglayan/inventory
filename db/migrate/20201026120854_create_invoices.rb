class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_number
      t.integer :pen_number
      t.integer :quantity
      t.decimal :tax_kdv
      t.decimal :tax_otv
      t.string :definition
      t.date :value_date
      t.decimal :sum
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
