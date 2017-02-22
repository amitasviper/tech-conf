require 'http'

class SlackAuthController < ApplicationController
  def initiate_auth
    slack_app_url = Rails.application.secrets.slack_app
    params = {'redirect_to': 'https://6e5224bb.ngrok.io/authresponse'}
    auth_url = generate_url(slack_app_url, params)
    redirect_to auth_url
  end

  def auth_response
    @resp = params
    puts "THE RESPONSE IS : #{@resp}"
    puts @resp[:ok]
    render 'slack_auth/auth_response'
  end
end