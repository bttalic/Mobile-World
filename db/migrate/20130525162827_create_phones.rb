class CreatePhones < ActiveRecord::Migration
  def change
    create_table :phones do |t|
      t.string :make
	  t.string :model
      t.integer :sizeh
	  t.integer :sizew
	  t.integer :sized
	  t.float :weight
	  t.string :processor
	  t.float :procfrequency
	  t.integer :batterycapacity
	  t.integer :talktime
	  t.integer :standbytime
	  t.integer :screensize
	  t.integer :screenresh
	  t.integer :screenresw
	  t.string :screentype
	  t.integer :screencolors
	  t.float :mcamera
	  t.integer :mcameraresph
	  t.integer :mcamerarespw
	  t.integer :mcameraresvh
	  t.integer :mcameraresvw
	  t.string :mcamerav
	  t.float :scamera
	  t.float :intmemory
	  t.float :extmemory
	  t.string :osname
	  t.string :osversion
	  t.string :gpu
	  t.boolean :bt	  
	  t.boolean :wlan
	  t.boolean :ir
	  t.boolean :usb
	  t.boolean :nfc
	  t.boolean :gprs
	  t.boolean :g3g
	  t.string :other

	  t.integer :userid
      t.timestamps
    end
  end
end
