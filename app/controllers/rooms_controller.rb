class RoomsController < ApplicationController
  before_action :authenticate_api_user!, only: [ :create ]

def show
  @messages = Message.all
end
end
