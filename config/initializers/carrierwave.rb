# config/initializers/carrierwave.rb

CarrierWave.configure do |config|
	config.storage = :aws
	config.aws_bucket = ENV["AWS_BUCKET"]
	config.aws_acl = "public-read"
	
	config.aws_credentials = {
		access_key_id: ENV["AWS_ACCESS_KEY"], secret_access_key: ENV["AWS_SECRET_KEY"], region: ENV["AWS_REGION"]
	}
end

# To prevent bugs when switching from fog to aws you need to update the initalizer first
# add the carrierwave-aws gem to gemfile
# add region to the application.yml file (AWS_REGION)
# update the uploader: change from fog to aws