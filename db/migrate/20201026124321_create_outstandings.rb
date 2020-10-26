class CreateOutstandings < ActiveRecord::Migration[6.0]
  def change
    create_table :outstandings do |t|
      t.references :product, null: false, foreign_key: true
      t.integer :value

      t.timestamps
    end
  end
end
