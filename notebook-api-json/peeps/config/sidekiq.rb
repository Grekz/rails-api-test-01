Rails.logger = Sidekiq::Logging.logger
ActiveRecord::Base.logger = Sidekiq::Logging.logger