require 'prime'

MAX_PRIME = 1_000_000

best_consecutive_primes = []

primes = Prime.each(MAX_PRIME).to_a
primes.reverse_each do |prime|

  consecutive_primes = []
  i = 0

  loop do
    break if primes[i] == prime

    sum = consecutive_primes.sum
    if sum < prime
      consecutive_primes.push primes[i]
      i += 1
    elsif sum > prime
      removed_prime = consecutive_primes.shift

      if !best_consecutive_primes.empty? && best_consecutive_primes.first <= removed_prime
        break
      end
    else
      break
    end
  end

  if consecutive_primes.length > best_consecutive_primes.length
    best_consecutive_primes = consecutive_primes
  end
end

puts "Primes count: #{best_consecutive_primes.count}"
puts "Primes sum: #{best_consecutive_primes.sum}"
puts "Primes: #{best_consecutive_primes.inspect}"
