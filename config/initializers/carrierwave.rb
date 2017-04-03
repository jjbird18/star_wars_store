if Rails.env.test? or Rails.env.development?
  CarrierWave.configure do |config|
    config.storage = :file
    config.root = "#{Rails.root}/tmp"
    config.cache_dir = "#{Rails.root}/tmp/images"
  end
else
  CarrierWave.configure do |config|
    config.fog_provider = 'fog/aws'
    config.fog_credentials = {
      :provider => 'AWS',
      :aws_access_key_id => ENV[''],
      :aws_secret_access_key => ENV[''],
      :region => ENV['us-east-1']
    }
    config.storage = :fog
    config.fog_directory = ENV['']
    config.asset_host = "#{ENV['AWS_S3_ASSET_URL']}/#{ENV['']}"
  end
end
