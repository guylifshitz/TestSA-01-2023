class MessagesController < ApplicationController
  include Pagy::Backend
  def index
    @messages = Message.all

    per_page = params[:per_page] 
    @pagy, @records = pagy(Message.all, items: per_page)
  
    respond_to do |format|
      format.html
      format.json  { render :json => @records.as_json(:include => {:tag => {:only => [:name, :id]}}) }
    end
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
      else
        @tags = Tag.all
        format.html { render :new, status: :unprocessable_entity }
      end
    end
  end
  
  def show
    @message = Message.find(params[:id])
    respond_to do |format|
      format.html
      format.json  { render :json => @message.as_json(:include => {:tag => {:only => [:name, :id]}}) }
    end
  end


  # GET tags/name/messages
  def index_by_tag
    tag_id = Tag.where(name: params[:name])
    @messages = Message.where(tag_id: tag_id)

    per_page = params[:per_page] 
    @pagy, @records = pagy(@messages.all, items: per_page)

    respond_to do |format|
      format.html  {render "index"}
      format.json  { render :json => @records.as_json(:include => {:tag => {:only => [:name, :id]}}) }
    end

  end
  

  private
  
  def message_params
    params.require(:message).permit(:author, :body_french, :body_pioupiou, :tag_id)
  end
    
end