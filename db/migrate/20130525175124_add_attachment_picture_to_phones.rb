class AddAttachmentPictureToPhones < ActiveRecord::Migration
  def self.up
    change_table :phones do |t|
      t.attachment :picture
    end
  end

  def self.down
    drop_attached_file :phones, :picture
  end
end
