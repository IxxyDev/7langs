# Define a module named ToFile
module ToFile
  # Define a method called filename that returns a string
  # The string is constructed by appending the object's unique identifier (object_id) to the prefix "object_" and appending ".txt" at the end
  def filename
    "object_#{self.object_id}.txt"
  end

  # Define a method called to_f
  # The method opens a file with the filename obtained from the filename method in write mode ('w')
  # It then writes the string representation of the object (obtained from the to_s method) to the file
  def to_f
    File.open(filename, 'w') {|f| f.write(to_s)}
  end
end

# Define a class named Person
class Person
  # Include the ToFile module in the Person class
  include ToFile

  # Define an attribute accessor for the name instance variable
  attr_accessor :name

  # Define an initialize method that takes a name parameter
  # The method assigns the name parameter to the name instance variable
  def initialize(name)
    @name = name
  end

  # Define a to_s method that returns the value of the name instance variable
  def to_s
    name
  end
end


Person.new('matz').to_f # Create a new instance of Person with the name "matz" and call the to_f method on it