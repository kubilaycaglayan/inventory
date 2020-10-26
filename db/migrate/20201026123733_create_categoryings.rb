class CreateCategoryings < ActiveRecord::Migration[6.0]
  def change
    create_table :categoryings do |t|
      t.references :category, null: false, foreign_key: true
      t.references :product, null: false, foreign_key: true

      t.timestamps
    end
  end
end
