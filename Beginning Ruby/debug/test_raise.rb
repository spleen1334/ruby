# Ovo je TDD uz pomoc raise, unless, == itd...
class String
  def titleize
    # Start
    # self.capitalize

    # after test 1
    # self.gsub(/\b\w/) { |char| char.upcase }

    # after test 2
    # self.gsub(/\s\w/) { |char| char.upcase }

    # after test 3
    self.gsub(/(\A|\s)\w/) { |char| char.upcase }
  end
end

# REGEX
# b = word boundaries (u njih se racuna whitespace + nonletterchars)
# w = first letter of each word ?
# s = white space
# A = nisam siguran


# TESTS
raise "Fail 1" unless "this is a test".titleize == "This Is A Test"
raise "Fail 2" unless "another test 1234".titleize == "Another Test 1234"
raise "Fail 3" unless "We're testing titleize".titleize == "We're Testing Titleize"


# DATA
puts "this is a test".titleize
