class Patient

  attr_reader :name

  @@all = []
  
  def initialize(name)
    @name = name
    @@all << self
  end

  def self.all
    @@all
  end

  def new_appointment(doctor, date)
    Appointment.new(date, self, doctor)
  end

  def appointments
    Appointment.all.select do |appointment|
      appointment.patient == self
    end
  end

  def doctors
    doctors = []
    appointments.each do |appointment|
      doctors << appointment.doctor
    end
    doctors.uniq
  end

end