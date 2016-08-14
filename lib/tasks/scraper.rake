# frozen_string_literal: true
require 'httparty'
require 'json'

namespace :scraper do
  namespace :udacity do
    desc 'fetch all courses from udacity'
    task scrape: :environment do
      courses_url = 'https://www.udacity.com/public-api/v0/courses'

      response = HTTParty.get(courses_url)

      json = JSON.parse(response.body)

      courses = json['courses']

      courses.each do |course|
        @resource = Resource.new
        @resource.title = course['title']
        @resource.description = course['short_summary']
        @resource.link = course['homepage']
        @resource.image_url = course['image']
        @resource.cost = 0
        @resource.level = course['level']
        @resource.tag_list = course['tracks']

        @resource.save
        print '.'
      end
    end
  end
end
