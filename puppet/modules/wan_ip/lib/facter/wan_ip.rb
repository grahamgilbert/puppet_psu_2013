#wan_ip.rb
require 'net/http'
require 'ipaddr'
Facter.add(:wan_ip) do
  url = URI.parse('http://ipecho.net/plain')
  req = Net::HTTP::Get.new(url.path)
  res = Net::HTTP.start(url.host, url.port) {|http|
    http.request(req)
  }
  setcode do
    if !(IPAddr.new(res.body) rescue nil).nil? == true
      res.body
    end
  end
end