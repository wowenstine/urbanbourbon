class AddSlugToSubscriptions < ActiveRecord::Migration
  class Sunscription < ActiveRecord::Base
  end

  def change
    add_column :subscriptions, :slug, :string, index: true

    Subscription.all.each do |subscription|
      subscription.slug = subscription.name.parameterize
      subscription.save
    end
  end
end
