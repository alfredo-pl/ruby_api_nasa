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

def buid_web_page(hash)

    html = "<html>\n"
    head ="<head>\n"
    tittle = "<title>Desafio Api Nasa</title>\n"
    cierre_head ="</head>\n"
    body = "<body>\n"
    h1= "<h1>Desafio Api Nasa</h1>"
    ul = "<ul style='display: flex;flex-wrap: wrap;justify-content: space-evenly;'>\n"
    li=""
        hash.each do |k , v|
            li += "<li style='list-style: none;'><img src='#{v}' style='width:300px;height:300px'></li>\n"
        end
    ciere_ul ="</ul\n>"
    cierre_body ="</body>\n"
    cierre_html="</html>"

    build = html+head+tittle+cierre_head+body+h1+ul+li+ciere_ul+cierre_body+cierre_html



    File.write('index.html', build)

end

hash = request(url,key)
buid_web_page(hash)

