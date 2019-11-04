class Doctor
    attr_reader :name, :patient
    @@all = []

    def initialize(name)
        @name = name
        @@all << self
    end

    def self.all
        @@all
    end

    def new_appointment(patient, date)
        Appointment.new(date, patient, self)
    end

    def appointments
        Appointment.all.select do |appts|
            appts.doctor == self
        end
    end

    def patients
        appointments.map do |appts|
            appts.patient
        end
    end
end

# class Doctor
#     attr_accessor :name
  
#     @@all = []
  
#     def initialize(name)
#       @name = name
#       @@all << self
#     end
  
#     def self.all
#       @@all
#     end
  
#     def new_appointment(patient, date)
#       Appointment.new(date, patient, self)
#     end
  
#     def appointments
#       Appointment.all.select { |appointment| appointment.doctor == self }
#     end
  
#     def patients
#       appointments.map(&:patient)
#     end
#   end