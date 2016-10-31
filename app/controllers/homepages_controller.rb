#require "slack_api_wrapper"
#require "channel"



class HomepagesController < ApplicationController
  def index
    @data = Slack_Api_Wrapper.list_channels
  end

  def create
    Slack_Api_Wrapper.send_message(params[:channel], params[:message])

  end

  def new
    @channel = params[:name]
    @channel_id = params[:id]
  end
end
