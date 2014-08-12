class AddAttachmentImageToBourbons < ActiveRecord::Migration
  def self.up
    change_table :bourbons do |t|
      t.attachment :image
    end
  end

  def self.down
    remove_attachment :bourbons, :image
  end
end
