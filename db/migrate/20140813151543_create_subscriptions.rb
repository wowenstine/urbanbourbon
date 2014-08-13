class CreateSubscriptions < ActiveRecord::Migration
  def change
    create_table :subscriptions do |t|
      t.string :name
      t.text :description
      t.string :price
      t.timestamps
    end
  end
end
