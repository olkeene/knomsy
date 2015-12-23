module MailerHelper
  def emails_in_enqueue
    ActiveJob::Base.queue_adapter.enqueued_jobs.find_all do |hash|
      hash[:job] == ActionMailer::DeliveryJob
    end.size
  end
end
