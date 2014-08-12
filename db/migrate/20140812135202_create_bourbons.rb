class CreateBourbons < ActiveRecord::Migration
  def change
    create_table :bourbons do |t|
      t.string :name
      t.text :description
      t.integer :year
      t.timestamps
    end
  end
end
