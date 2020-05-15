require "chrome_remote"

chrome = ChromeRemote.client
chrome.send_cmd "Network.enable"

chrome.on "Network.requestWillBeSent" do |obj|
  puts obj["request"]["url"]
end

$total = 0
chrome.on "Network.dataReceived" do |obj|
  $total = $total + obj["dataLength"]
  puts $total
end

chrome.listen
