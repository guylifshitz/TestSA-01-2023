class MessagesController < ApplicationController
  def index
    @messages = Message.all
  end

  def new 
    @message = Message.new
    @tags = Tag.all
  end

  def create
    @message = Message.new(message_params)
 
    respond_to do |format|
      if @message.save
        format.html { redirect_to message_url(@message), notice: "Message was successfully created." }
        format.json { render :show, status: :created, location: @message }
      else
        @tags = Tag.all
        format.html { render :new, status: :unprocessable_entity }
        format.json { render json: @message.errors, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @message = Message.find(params[:id])

    respond_to do |format|
      format.html
      format.json  { render :json => @post }
    end
  end


  # GET tags/name/messages
  def index_by_tag
    tag_id = Tag.where(name: params[:name])
    @messages = Message.where(tag_id: tag_id)
    render "index"
  end
  

  private
  
  def message_params
    params.require(:message).permit(:author, :body_french, :body_pioupiou, :tag_id)
  end
    
end