class MessagesController < ApplicationController
  # GET /messages
  # GET /messages.json
  def index
    @messages = Message.all
    @messages = @messages.sort{|y, x|(x.id) <=> (y.id)}

    respond_to do |format|
      format.html # index_bk.html.erb
      format.json { render json: @messages }
    end
  end

  # GET /messages/1
  # GET /messages/1.json
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html # show.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/new
  # GET /messages/new.json
  def new
    @message = Message.new

    respond_to do |format|
      format.html # new.html.erb
      format.json { render json: @message }
    end
  end

  # GET /messages/1/edit
  def edit
    @message = Message.find(params[:id])
  end

  # POST /messages
  # POST /messages.json
  def create
    @message = Message.new(params[:message])
    @message.score = 0
    @message.content = @message.content + " FML!"


    respond_to do |format|
      if @message.save
        format.html { redirect_to messages_url, notice: 'Message was successfully created.' }
        format.json { render json: @message, status: :created, location: @message }
      else
        format.html { render action: "new" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # PUT /messages/1
  # PUT /messages/1.json
  def update
    @message = Message.find(params[:id])

    respond_to do |format|
      if @message.update_attributes(params[:message])
        format.html { redirect_to @message, notice: 'Message was successfully updated.' }
        format.json { head :no_content }
      else
        format.html { render action: "edit" }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end

  # DELETE /messages/1
  # DELETE /messages/1.json
  def destroy
    @message = Message.find(params[:id])
    respond_to do |format|
      if params[:attempt].eql?(@message.answer)
        @message.destroy
        @messages = Message.all
        format.html { redirect_to messages_url, notice: 'Message was successfully deleted.' }
      else
        format.html { redirect_to @message, notice: 'your answer is wrong, unable to delete the post' }
      end
    end
  end

  def reply
    @message = Message.find(params[:id])
    @reply = @message.replies.create(:content => params[:content], :message_id => params[:id])
    respond_to do |format|
      if @reply.save
        @messages = Message.all
        format.html { redirect_to messages_url, notice: 'successfully replied.' }
      else
        format.html { redirect_to @message, notice: 'unable to reply' }
      end
    end
  end

  def get_count
    Message.count
  end
end
