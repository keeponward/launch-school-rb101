vehicles = [
  'car', 'car', 'truck', 'car', 'SUV', 'truck',
  'motorcycle', 'motorcycle', 'CAR', 'trUck']

def count_occurrences(veh)
  hash = {}
  veh.each do |veh_type|
    veh_lower = veh_type.downcase
    if hash.has_key?(veh_lower)
      hash[veh_lower] += 1
    else hash[veh_lower] = 1 
    end
  end
  return hash
end

hash = count_occurrences(vehicles)

hash.each do |k, v|
  puts "#{k} => #{v}"
end
