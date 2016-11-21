class MusicsController < ApplicationController
  before_action :set_music, only: [:show, :edit, :update, :destroy]
  include RecipientsFor::MessageServices
  include RecipientsFor::ReaderServices

  def index
    @musics = Music.all
  end

  def show
    #all_messageble_messages(@music)
    @messages = @music.all_messages
  end


  private
    # Use callbacks to share common setup or constraints between actions.
    def set_music
      @music = Music.find(params[:id])
    end

end
