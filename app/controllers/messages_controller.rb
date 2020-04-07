class MessagesController < ApplicationController
    def index
        @messages = Message.all
    end
    
    def new
        @message = Message.new
    end

    def create
        Message.create(message_params)
    end

    def show
        @message = Message.find(params[:id])
    end

    def destroy
        Message.delete(params[:id])
    end

    private
    def message_params
        params.require(:message).permit(:name, :content)
    end
end
