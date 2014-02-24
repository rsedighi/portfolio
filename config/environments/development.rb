Portfolio::Application.configure do

  Paperclip.options[:command_path] = "/usr/bin/"

  config.cache_classes = false

  config.eager_load = false

  config.consider_all_requests_local       = true

  config.action_controller.perform_caching = false

  config.action_mailer.raise_delivery_errors = false

  config.action_mailer.default_url_options = { :host => 'localhost:3000' }

  config.active_support.deprecation = :log

  config.active_record.migration_error = :page_load

  config.assets.debug = true

  Paperclip.options[:command_path] = "/usr/local/bin/"

  config.paperclip_defaults = {
    :storage => :s3,
    :s3_protocol => 'http',
    :s3_credentials => {
      :bucket => ENV['AWS_BUCKET'],
      :access_key_id => ENV['AWS_ACCESS_KEY_ID'],
      :secret_access_key => ENV['AWS_SECRET_ACCESS_KEY']
    }
  }



end
