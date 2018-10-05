require 'net/http'
require 'json'
require 'httparty'
uri = URI.parse("http://api.giphy.com/v1/gifs/search?q=ryan+gosling&api_key=eE82y9g3YqCOAI6Nl4dQoMDRjvQZgjPx&limit=5")
resp = Net::HTTP.get_response(uri)
buffer = resp.body
result = JSON.parse(buffer)

def format_nice(thing, indent = 0)
  if(thing.class == Hash)
    thing.each do |k, v|
      if(v.class == Hash || v.class == Array)
        puts (" " * indent) + "#{k} -> "
        format_nice(v, indent + 2)
      else
        puts (" " * indent) + "#{k} -> #{v}"
      end
    end
  elsif (thing.class == Array)
    thing.each do |v|
      if(v.class == Hash || v.class == Array)
        puts (" " * indent) + ": -> "
        format_nice(v, indent + 2)
      else
        puts (" " * indent) + "#{v}"
      end
    end
  else
    print ((indent * " ") + thing.to_s)
  end
end

# puts result['data'].length

response = HTTParty.get("http://api.giphy.com/v1/gifs/search?q=ryan+reynolds&api_key=eE82y9g3YqCOAI6Nl4dQoMDRjvQZgjPx&limit=5")
response['data'].each { |res| puts res['url']}

# result['data'].each do |res|
#   puts res['url']
# end