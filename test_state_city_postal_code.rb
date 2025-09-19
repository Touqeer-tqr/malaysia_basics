require 'active_support/core_ext/hash/indifferent_access'
require 'json'
require 'json'

file_content = File.read('malaysia_postal_codes_states.json')
@data = JSON.parse(file_content).with_indifferent_access

def get_all_states
  @data.keys
end

def get_state_by_city(city)
  @data.each do |state, cities|
    return state if cities.keys.include?(city)
  end
end

def get_cities_by_state(state)
  @data[state].map(&:first)
end

def get_postal_code_by_city(city)
  @data.values.map(&:to_a).flatten(1).to_h[city]
end

def get_city_by_postal_code(postal_code)
  @data.values.map(&:to_a).flatten(1).to_h.each do |city, postal_codes|
    return city if postal_codes.include?(postal_code)
  end
end

puts <<IDEA
================= Idea =================
 The idea is that user will only enter postal code.
 And FE will auto fill up the state & city fields.
 We also don't need to save city & state
 as we can get them using the postal_code
========================================
IDEA


puts "\n================= All States ================="
puts get_all_states

puts "\n================= State by City ================="
puts get_state_by_city("Port Dickson")

puts "\n================= Cities by State ================="
puts get_cities_by_state("Negeri Sembilan")

puts "\n================= Postal Codes by City ================="
puts get_postal_code_by_city("Port Dickson")

puts "\n================= City by Postal Code ================="
puts get_city_by_postal_code("71009")

puts "\n================= Ta da....The end ================="
