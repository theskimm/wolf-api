# frozen_string_literal: true

require 'uri'
require 'net/http'

class BotClient
  BOT_URL = 'https://162f-68-132-139-10.ngrok.io'

  def self.generate_roadmap(user, journey)
    uri = URI("#{BOT_URL}/generate-tasks")
    headers = {'Content-Type': 'application/json'}

    request = {
      user: {
        birthdate: user.birthdate,
        city: user.city,
        state: user.state
      },
      journey: journey.name
    }

    bot_response = Net::HTTP.post(uri, request.to_json, headers)
    JSON.parse(bot_response.body).deep_symbolize_keys
  end

  def self.get_latest_content_for_task(task)
    uri = URI("#{BOT_URL}/generate-task-content")
    headers = {'Content-Type': 'application/json'}

    request = { task_description: task.description }

    bot_response = Net::HTTP.post(uri, request.to_json, headers)
    contentful_id = JSON.parse(bot_response.body)

    'this is a contentful id'
  end
end
