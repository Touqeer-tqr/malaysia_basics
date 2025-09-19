# https://github.com/AsyrafHussin/malaysia-postcodes/blob/main/all.json
require 'active_support/core_ext/hash/indifferent_access'
require 'yaml'
require 'json'

validations = YAML.load_file('validations.yml').with_indifferent_access

# p validations[:my][:user][:phone_number][:regex]
# regex = validations[:my][:user][:phone_number][:regex]
# p regex.match?("199550994") 

# p '========= phone_number ========='
# regex =  Regexp.new(validations[:my][:user][:phone_number][:regex])
# p regex
# p regex.match?("112233445") 
# r = /^1\d{8,9}$/
# p r
# p r.match?("112233445") 


# p '========= name ========='
# regex =  Regexp.new(validations[:my][:user][:name][:regex])
# p regex
# p regex.match?("touqeer")

# p validations
