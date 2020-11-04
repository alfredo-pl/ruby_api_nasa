require 'net/http'
require 'json'

url = 'https://api.nasa.gov/mars-photos/api/v1/rovers/curiosity/photos?sol=1000&page=1'
key = 'PC0AkbQt9j8UXjv2oMBhVUE2UiVqRiqnohtCBZn7'

def request(url , key)
    hash = {}
    url_completa = url+"&api_key="+key
    uri = URI(url_completa)
    response = Net::HTTP.get(uri)
    parsed_response = JSON.parse(response)
    photos = parsed_response['photos']
        photos.size.times do |i|
            hash[i] = photos[i]['img_src']
        end
        hash
end

puts request(url,key)


