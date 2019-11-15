class CreateItems < ActiveRecord::Migration[5.1]
  def change
    create_table :items do |t|
      t.string :name
      t.string :description
      t.integer :base_price
      t.boolean :sold
      t.references :auction, foreign_key: true

      t.timestamps
    end
  end
end
