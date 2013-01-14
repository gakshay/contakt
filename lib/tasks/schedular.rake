desc "This task is called by the Heroku cron add-on"
task :wake_me_up => :environment do
  uri = ""
  if Rails.env == "production"
    uri = "http://www.contaktus.com"
  end
  Net::HTTP.get(URI.parse(uri)) unless uri.blank?
end