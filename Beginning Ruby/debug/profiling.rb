# PROFILING
# Omogucava proveru odredjenog koda i vremena izvrsenja tog koda

require 'profile' # Ruby builtin profiler

class Calculator
  def self.count_to_large_number
    x = 0
    100000.times { x += 1  }
  end

  def self.count_to_small_number
    x = 0
    1000.times { x += 1  }
  end
end

Calculator.count_to_large_number
Calculator.count_to_small_number

# Pokrece se sa:
# ruby -r profile nameoffile.rb
#
# Informacije iz rezultatta profilera:
# The result contains a number of columns. The first is the percentage of time
# spent within
# the method named in the far right column. In the preceding example, the
# profiler shows that
# 70.76 percent of the total execution time was spent in the times method in
#    the Integer class.
#    The second column shows the amount of time in seconds rather than as
#    a percentage.
#    The calls column specifies how many times that method was called. In our
#    case, times
#    was called only twice.
