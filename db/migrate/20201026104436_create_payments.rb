class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :kind
      t.string :bank
      t.decimal :comission, precision: 20, scale: 2
      t.references :sale, null: false, foreign_key: true

      t.timestamps
    end
  end
end
