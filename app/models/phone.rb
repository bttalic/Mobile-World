class Phone < ActiveRecord::Base
	attr_accessible :userid, :make,:model,:sizeh, :sizew, :sized, :weight, :processor, :procfrequency, :batterycapacity, :talktime, :standbytime, :screensize, :screenresh, :screenresw, :screentype, :screencolors, :mcamera, :mcameraresph, :mcamerarespw, :mcameraresvh, :mcameraresvw, :mcamerav, :scamera, :intmemory, :extmemory, :osname, :osversion, :gpu, :bt , :wlan, :ir, :usb, :nfc, :gprs, :g3g, :other, :picture

	belongs_to :user

	has_attached_file :picture, :url  => "/assets/phoneimgs/:id/:basename.:extension",
	:path => ":rails_root/public/assets/phoneimgs/:id/:basename.:extension", :default_url => "/assets/images/default_phone.png"
	has_many :comments, dependent: :destroy

	#validates_attachment_presence :picture
	#validates_attachment_size :picture, :less_than => 5.megabytes
	#validates_attachment_content_type :picture, :content_type => ['image/jpeg', 'image/png']

	#validates :make,:model,:sizeh, :sizew, :sized, :weight, :processor, :procfrequency, :batterycapacity, :talktime, :standbytime, :screensize, :screenresh, :screenresw, :screentype, :screencolors, :mcamera, :mcameraresph, :mcamerarespw, :mcameraresvh, :mcameraresvw, :mcamerav, :intmemory, :osname, :osversion, :presence => true
	#validates :make,:model,:sizeh, :sizew, :sized, :weight, :processor, :procfrequency, :batterycapacity, :talktime, :standbytime, :screensize, :screenresh, :screenresw, :screentype, :screencolors, :mcamera, :mcameraresph, :mcamerarespw, :mcameraresvh, :mcameraresvw, :mcamerav, :scamera, :intmemory, :extmemory, :osname, :osversion, length: {minimum: 2, maximum: 30}
	#validates :sizeh, :sizew, :sized, :weight, :procfrequency, :batterycapacity, :talktime, :standbytime, :screensize, :screenresh, :screenresw, :screencolors, :mcamera, :mcameraresph, :mcamerarespw, :mcameraresvh, :mcameraresvw, :mcamerav, :intmemory, :numericality => true
end
