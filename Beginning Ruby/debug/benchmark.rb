# BENCHMARKING
# merenje performansi programa
# Ruby ima modul Benchmark

# Benchmark simple
# require 'benchmark'
# puts Benchmark.measure {10000.times { print '.' }}

# Rezultati: 1. User CPU time 2. System CPU time 3.Total CPU (real time taken)

# Benchmark 2 (dva puta se pokrece)
# require 'benchmark'
# iterations = 1000000
#
# b = Benchmark.measure do
#   for i in 1..iterations do
#     x = i
#   end
# end
#
# c = Benchmark.measure do
#   iterations.times do |i|
#     x = i
#   end
# end
#
# puts b
# puts c

# Benchmark 3 (bm)
# isto sto i benchmark 2, sa vise info
#
# Postoji i bmbm ponavlja test 2 puta
require 'benchmark'
iterations = 1000000

Benchmark.bm do |bm|
  bm.report("for:") do
    for i in 1..iterations do
      x = i
    end
  end
  bm.report("times:") do
    iterations.times do |i|
      x = i
    end
  end
end
