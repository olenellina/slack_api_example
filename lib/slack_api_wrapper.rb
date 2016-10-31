### Note: If something is not working, try to bundle install again ###
### Also: If you change anything here and are testing in the console, exit the console and restart

require 'httparty'

class Slack_Api_Wrapper
  TOKEN = ENV["SLACK_TOKEN"]
  BASE_URL = "https://slack.com/api/"

  def self.list_channels
    url = BASE_URL + "channels.list?token=#{TOKEN}"

    response = HTTParty.get(url)

    my_channels = []

    # response["channels"].each do |channel|
    #   id = channel["id"]
    #   name = channel["name"]
    #   my_channels << Slack_Channel.new(name, id)
    # end

    response["channels"].length.times do |x|
      id = response["channels"][x]["id"]
      name = response["channels"][x]["name"]
      my_channels << Slack_Channel.new(name, id)
    end

    return my_channels
  end

  # def self.send_message(channel, msg)
  #   url = BASE_URL + "chat.postMessage?token=#{TOKEN}" + "&text=#{msg}" + "&channel=#{channel}"
  #
  #   response = HTTParty.get(url)
  # end

  # Another way, from textbook circulum 
  def self.sendmsg(channel, msg, token = nil)
  token = TOKEN if token == nil
  puts "Sending message to channel #{channel}: #{msg}"

  url = BASE_URL + "chat.postMessage?" + "token=#{token}"
  data = HTTParty.post(url,
  body:  {
    "text" => "#{msg}",
    "channel" => "#{channel}",
    "username" => "Hankey",
    "icon_emoji" => ":hankey:",
    "as_user" => "false"
  },
  :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
end

end
