class MessagesController < ApplicationController
  def create
    message = current_user.messages.build(message_params)
    if message.save
      ActionCable.server.broadcast "chatroom_channel",
                                    foo: message_render(message)
    end
  end

  private

  def message_params
    params.require(:message).permit(:text)
  end

  def message_render(message)
    render(partial: 'message', locals: {message: message})
  end
end