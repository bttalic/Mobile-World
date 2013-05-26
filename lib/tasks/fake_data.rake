namespace :db do
	desc "Fill database with sample data"
	task populate: :environment do
		make_users
		make_phones
		make_comments
	end
end

def make_users
	admin = User.create!(name: "b.ttalic2",
		email: "b.ttalic2@gmail.com",
		password: "123456",
		password_confirmation: "123456")
	admin.toggle!(:admin)
	99.times do |n|
		name = Faker::Name.name
		email = "example-#{n+1}@example.com"
		password = "password"
		User.create!(name: name,
			email: email,
			password: password,
			password_confirmation: password)
	end
end

def make_phones
	99.times do |n|
		userid= 1+rand(99)
		make = Faker::Name.name
		model = Faker::Name.name
		sizeh = 220
		sizew = 150 
		sized = 3
		weight =3 
		processor ="Quadcore"
		procfrequency =2
		batterycapacity = 1600 
		talktime=2
		standbytime = 15
		screensize = 5 
		screenresh =120
		screenresw =  256
		bt=true
		wlan=false 
		ir= true 
		usb=true 
		nfc=true
		gprs=true 
		g3g=true
		other=true
		screentype = "touch"
		screencolors = 16
		mcamera = 8
		mcameraresph = 4128
		mcamerarespw = 3096
		mcameraresvh = 1280
		mcameraresvw = 720
		mcamerav = 720
		scamera = 1.3
		intmemory = 16
		extmemory = 64
		osname = "Android"
		osversion="4.1.2"
		gpu="Nvidia"

		Phone.create(
			userid: userid,
			make: make,
			model: model,
			sizeh: sizeh,
			sizew: sizew,
			sized: sized,
			weight: weight,
			processor: processor,
			procfrequency: procfrequency,
			batterycapacity: batterycapacity,
			talktime: talktime,
			standbytime: standbytime,
			screensize: screensize,
			screenresh: screenresh,
			screenresw: screenresw,
			screentype: screentype,
			screencolors: screencolors,
			mcamera: mcamera,
			mcameraresph: mcameraresph,
			mcamerarespw: mcamerarespw,
			mcameraresvh: mcameraresvh,
			mcameraresvw: mcameraresvw,
			mcamerav: mcamerav,
			scamera: scamera,
			intmemory: intmemory,
			extmemory: extmemory,
			osname: osname,
			osversion: osversion,
			gpu:  gpu ,
			bt: bt,
			wlan: wlan,
			ir:  ir,
			usb: usb,
			nfc: nfc,
			gprs: gprs,
			g3g: g3g
			)
	end


end

def make_comments
	99.times do |n|
		content = "spam#{n+1}"
		user_id = 1+rand(99)
		phone_id = 1+rand(99)
		Comment.create(
			content: content,
			user_id: user_id,
			phone_id: phone_id
			)
	end

end


