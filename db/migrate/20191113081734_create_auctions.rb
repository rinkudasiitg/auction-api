class CreateAuctions < ActiveRecord::Migration[5.1]
  def change
    create_table :auctions do |t|
      t.string :title
      t.string :description
      t.datetime :start_time
      t.datetime :end_time
      t.integer :created_by

      t.timestamps
    end
  end
end
