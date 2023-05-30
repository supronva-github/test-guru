CarrierWave.configure do |config|
  config.fog_credentials = {
    provider: 'AWS',
    aws_access_key_id: ENV['YANDEX_DISK_STORAGE_ACCESS_KEY_ID'],
    aws_secret_access_key: ENV['YANDEX_DISK_STORAGE_SECRET_ACCESS_KEY'],
    region: 'ru-central1',
    endpoint: 'https://storage.yandexcloud.net'
  }
  config.fog_directory = ENV['YANDEX_BUCKET']
  config.fog_public = false
  config.cache_dir = "#{Rails.root}/tmp/uploads"
  config.storage = :fog
end
