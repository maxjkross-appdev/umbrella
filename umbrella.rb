p "Where are you located?"

user_location = gets.chomp

gmaps_url = "https://maps.googleapis.com/maps/api/geocode/json?address=#{user_location}&key=#{ENV.fetch("GMAPS_KEY")}"


require("open-uri")
require("json")
raw_data = URI.open(gmaps_url).read

hash = JSON.parse(raw_data)
result_array = hash.fetch("results")

only_result = result_array[0]
geo = only_result.fetch("geometry")
loc = geo.fetch("location")

latitude = loc.fetch("lat")
longitude = loc.fetch("lng")

dark_skys_url = "https://api.darksky.net/forecast/#{ENV.fetch("DARK_SKY_KEY")}/#{latitude},#{longitude}"




#p "Your coordinates are " + latitude.to_s + ", " + longitude.to_s
