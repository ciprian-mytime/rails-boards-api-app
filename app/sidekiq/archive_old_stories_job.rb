class ArchiveOldStoriesJob
  include Sidekiq::Job

  def perform(*args)
    stories_to_archive = Story.where("created_at < ?", 1.year.ago)

    stories_to_archive.each do |story|
      story.update!(status: "archived")
    end
  end
end
