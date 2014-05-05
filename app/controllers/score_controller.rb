require 'net/http'
class ScoreController < ApplicationController

  def broadcast
    data=params['data']
    broadcast_message('/messages/score',data)
  end

  def index 
    
  end

  def  broadcast_message(channel, data)
    message = {:channel => channel, :data => data}
    uri = URI.parse("http://localhost:9292/faye")
    x=Net::HTTP.post_form(uri, :message => message.to_json)
    render :json =>x
end

end
