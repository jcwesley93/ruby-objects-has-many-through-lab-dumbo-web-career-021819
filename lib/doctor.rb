class Doctor

	@@all = []

	attr_accessor :name

	def initialize(name)
		@name = name 
		@@all << self
	end

	def self.all
		@@all
	end

	def new_appointment(name, date)
		 Appointment.new(date, name, self)
	end

	def appointments
		Appointment.all.select do |appointment| 
			appointment.doctor == self
		end
	end

	def patients
		self.appointments.map do |appointment| 
			appointment.patient
		end
	end

end
