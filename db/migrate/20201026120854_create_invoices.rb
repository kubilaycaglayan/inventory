class CreateInvoices < ActiveRecord::Migration[6.0]
  def change
    create_table :invoices do |t|
      t.integer :invoice_number
      t.integer :pen_number
      t.integer :quantity
      t.decimal :tax_kdv, precision: 5, scale: 2
      t.decimal :tax_otv, precision: 5, scale: 2
      t.string :definition
      t.date :value_date
      t.decimal :sum, precision: 20, scale: 2
      t.string :product_code, null: false

      t.timestamps
    end

    add_index :invoices, [:invoice_number, :pen_number], unique: true
  end
end
