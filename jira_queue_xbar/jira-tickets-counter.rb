#!/usr/bin/env ruby
# frozen_string_literal: true

require 'json'
require 'base64'
require 'net/http'

def get(uri)
  credentials = Base64.strict_encode64("#{ENV['JIRA_USER_EMAIL']}:#{ENV['JIRA_API_TOKEN']}")
  Net::HTTP.start(uri.host, uri.port, use_ssl: true) do |https|
    request = Net::HTTP::Get.new(uri)
    request['Content-Type'] = 'application/json'
    request['Authorization'] = "Basic #{credentials}"

    response = https.request(request)
    response.code.start_with?('20') ? JSON.parse(response.body) : response.body
  end
end

# This makes the colour pick between: green (#02A61E), orange (#FC8900) or red (#FF0000)
# green is for zero, orange is for between 1 and 5 and red for 6 and on
def pick_hex_colour(tickets_size)
  case tickets_size
  when 0
    '#02A61E'
  when 1..5
    '#FC8900'
  else
    '#FF0000'
  end
end

uri = URI('https://jobandtalent.atlassian.net/rest/servicedeskapi/servicedesk/1/queue/18/issue')
response = get(uri)

puts "#{response['size']} :ticket: | size=16 color=#{pick_hex_colour(response['size'])}"
puts '---'
puts 'No :ticket: to solve :tada:' if response['size'].zero?

response['values'].each do |ticket|
  url = "https://jobandtalent.atlassian.net/browse/#{ticket['key']}"
  puts "#{ticket['key']} - #{ticket.dig('fields', 'summary')} | href=#{url} size=12"
  puts '---'
end

# In order to make it work you gotta set both global ENV vars in as follows:
# launchctl setenv "JIRA_USER_EMAIL" "marcelo.ribeiro@jobandtalent.com"
# launchctl setenv "JIRA_API_TOKEN" JIRA_API_TOKEN_HERE

# You can create your JIRA_API_TOKEN at https://id.atlassian.com/manage-profile/security/api-tokens

# Checkout https://developer.atlassian.com/cloud/jira/service-desk/rest/api-group-servicedesk/
# Especially #api-rest-servicedeskapi-servicedesk-servicedeskid-queue-queueid-get

