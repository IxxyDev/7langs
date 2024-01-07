# Monkey patching the Fixnum class to add the custom method my_times.
class Fixnum
  # Executes the given block the number of times equal to the value of the Fixnum object.
  def my_times
    i = self
    while i > 0
      i -= 1
      yield
    end
  end
end

3.my_times { puts "moo" } // prints "moo" three times