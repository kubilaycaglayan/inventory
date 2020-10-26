class CreateCategories < ActiveRecord::Migration[6.0]
  def change
    create_table :categories do |t|
      t.string :kind
      t.string :definition
      t.integer :order_in_kind, default: 1

      t.timestamps
    end
  end
end
