class AddSlugToBourbon < ActiveRecord::Migration

  class Bourbon < ActiveRecord::Base
  end

  def change
    add_column :bourbons, :slug, :string, index: true

    Bourbon.all.each do |bourbon|
      bourbon.slug = bourbon.name.parameterize
      bourbon.save
    end
  end
end
