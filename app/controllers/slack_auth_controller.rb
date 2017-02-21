require 'http'

class SlackAuthController < ApplicationController
  def initiate_auth
    slack_url = 'https://slack.com/oauth/authorize'
    client_id = Rails.application.secrets.client_id
    puts "CLIENT_ID IS : #{client_id}"
    params = {'client_id': client_id,
              'scope': 'incoming-webhook,commands,bot',
              'redirect_uri': 'https://6e5224bb.ngrok.io/authresponse'
    }
    auth_url = generate_url(slack_url, params)
    redirect_to auth_url
  end

  def auth_response
    temp_code = params[:code]
    token_url = 'https://slack.com/api/oauth.access'
    params = {'client_id': Rails.application.secrets.client_id,
              'client_secret': Rails.application.secrets.client_secret,
              'code': temp_code
    }
    auth_url = generate_url(token_url, params)
    @resp = HTTP.get(auth_url).parse
    render 'slack_auth/auth_response'
  end
end
