class CreatePlans < ActiveRecord::Migration
  def change
    create_table :plans do |t|
      t.integer :amount
    end
  end
end
