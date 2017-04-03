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
      :aws_access_key_id => 'AKIAITYD62EEF6U7I6EQ',
      :aws_secret_access_key => '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',
      :region => 'us-east-1'
    }
    config.storage = :fog
    config.fog_directory = 'webd435bucket4741'
    config.asset_host = "#{ENV['AWS_S3_ASSET_URL']}/#{ENV['webd435bucket4741']}"
  end
end
