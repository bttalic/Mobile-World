class CreateCompares < ActiveRecord::Migration
  def change
    create_table :compares do |t|
      t.integer :user_id
      t.integer :phone1_id
      t.integer :phone2_id
      t.integer :phone3_id

      t.timestamps
    end
  end
end
