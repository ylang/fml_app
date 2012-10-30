class RepliesController < ApplicationController
  def index
    @message = Message.find(params[:message_id])
   # @replies = @message.replies

    respond_to do |format|
      format.html # index_bk.html.erb
    end

  end

  def create
    @message = Message.find(params[:message_id])
    @reply = @message.replies.create(:content => params[:attempt], :message_id => @message.id)
    respond_to do |format|
      if @reply.save
        @messages = Message.all
        format.html { redirect_to messages_url, notice: 'successfully replied.' }
      else
        format.html { redirect_to message_replies_url(@message), notice: 'unable to reply' }
      end
    end
  end
end
