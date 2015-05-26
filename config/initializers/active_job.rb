Rails.env.on(:production) do |config|
  config.active_job.queue_adapter = :sucker_punch
end
