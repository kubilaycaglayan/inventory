class CreatePayments < ActiveRecord::Migration[6.0]
  def change
    create_table :payments do |t|
      t.string :type
      t.string :bank
      t.decimal :comission
      t.references :sales, null: false, foreign_key: true

      t.timestamps
    end
  end
end
