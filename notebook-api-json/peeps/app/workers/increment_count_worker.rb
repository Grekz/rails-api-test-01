class IncrementCountWorker
  include Sidekiq::Worker

  def perform(*args)
    # Do something
    logger.error("My test")
    p "My Test"
  end
end

Sidekiq::Cron::Job.create(name: 'IncrementCount worker', cron: '0/5 * * * *', class: 'IncrementCountWorker') # execute at every 5 minutes, ex: 12:05, 12:10, 12:15...etc
