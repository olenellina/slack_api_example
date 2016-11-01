#require "slack_api_wrapper"
#require "channel"


# def self.sendmsg(channel, msg, token = nil)
#   token = TOKEN if token == nil
#   puts "Sending message to channel #{channel}: #{msg}"
#
#   url = BASE_URL + "chat.postMessage?" + "token=#{token}"
#   data = HTTParty.post(url,
#   body:  {
#     "text" => "#{msg}",
#     "channel" => "#{channel}",
#     "username" => "Roberts-Robit",
#     "icon_emoji" => ":robot_face:",
#     "as_user" => "false"
#   },
#   :headers => { 'Content-Type' => 'application/x-www-form-urlencoded' })
# end

class HomepagesController < ApplicationController
  def index
    @data = Slack_Api_Wrapper.list_channels
  end

  def create
    response = Slack_Api_Wrapper.sendmsg(params[:channel], params[:message])

    if response["ok"]
      flash[:notice] = "Message Sent Successfully to #{params[:channel]}"
    else
      flash[:notice] = "Message failed to be sent to #{params[:channel]}"
    end
    redirect_to root_path
  end

  def new
    @channel = params[:name]
    @channel_id = params[:id]
  end
end



# class HomepagesController < ApplicationController
#   def index
#     @data = Slack_Api_Wrapper.list_channels
#   end
#
#   def create
#     response = Slack_Api_Wrapper.send_message(params[:channel], params[:message])
#
#     if response["ok"]
#       flash[:notice] = "Message Sent Successfully to #{params[:channel]}"
#     else
#       flash[:notice] = "Message failed to be sent to #{params[:channel]}"
#     end
#     redirect_to root_path
#   end
#
#   def new
#     @channel = params[:name]
#     @channel_id = params[:id]
#   end
# end
