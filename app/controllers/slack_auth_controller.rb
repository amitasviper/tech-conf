require 'http'

class SlackAuthController < ApplicationController
  def initiate_auth
    slack_app_url = Rails.application.secrets.slack_app
    params = {'redirect_to': authresponse_url}
    auth_url = generate_url(slack_app_url, params)
    puts "Redirecting to : #{auth_url}"
    redirect_to auth_url
  end

  def auth_response
    @resp = params
    puts "THE RESPONSE IS : #{@resp}"
    puts @resp[:ok]
    render 'slack_auth/auth_response'
  end
end
