class Profile < ApplicationRecord
  serialize :skills, Array
  serialize :industry_expertise, Array
  serialize :languages, Array

  def get_data
    require 'net/http'
    url = URI.parse('http://www.ilanceit.com/freelancer_profiles.json')
    req = Net::HTTP::Get.new(url.to_s)
    res = Net::HTTP.start(url.host, url.port) {|http|
      http.request(req)
    }
   JSON.parse(res.body)
  end

  def ilance_profiles
    @ilance_profiles ||= get_data
  end

  def freelancers
    users = ilance_profiles.select {|x| x["user"] && x["user"]["first_name"].present? }
    Profile.transaction do 
      users.each do |user|
        profile = Profile.find_or_create_by(full_name: "#{user["user"]["first_name"]} #{user["user"]["last_name"]}")
        profile.skills = user["skills"]&.split(",")
        profile.title = user["title"]
        profile.full_name = "#{user["user"]["first_name"]} #{user["user"]["last_name"]}"
        profile.bio = user["overview"]
        profile.cost = user["hourly_rate"].to_f
        profile.picture_url = "http://ilanceit.com#{user['avatar']}"
        if profile.save
          puts "user has been created...."
        else
          puts "error...."
        end
      end
    end
  end

end
