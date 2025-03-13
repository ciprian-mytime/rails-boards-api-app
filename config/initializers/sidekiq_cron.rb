require "sidekiq/cron/job"

Sidekiq::Cron::Job.create(
    name: "Archive old stories",
    cron: "0 0 * * *",
    class: "ArchiveOldStoriesJob"
)
