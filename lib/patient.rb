#The Patient model:
class Patient
#The Patient class needs a class variable @@all that begins as an empty array.
attr_accessor :name
@@all =[]
#The Patient class needs a class method .all that lists each patient in the class variable.

#A patient is instantiated with a name and be saved in the @@all array.
  def initialize(name)
    @name = name
    save
  end

  def save
    @@all << self
  end

  def self.all
    @@all
  end
#The Patient class needs an instance method, #new_appointment, that takes in an argument
#of a doctor and a date and creates a new Appointment. The Appointment should know that it belongs to the patient.

def new_appointment(doctor, date)
  Appointment.new(date, self, doctor)
end


#The Patient class needs an instance method, #appointments, that iterates through the Appointments
# array and returns Appointments that belong to the patient.
def appointments
  Appointment.all.select { |appointment| appointment.patient == self }
end

#The Patient class needs an instance method, #doctors, that iterates over that patient's Appointments
#and collects the doctor that belongs to each Appointment.
def doctors
  appointments.map do |appointment|
    appointment.doctor
  end
end


end
