namespace :twitter do
  task :media, [:event_id] => :environment do |t, args|
    event = Event.find(args[:event_id])

    @client ||= Twitter::REST::Client.new
    tweets = @client.search("##{event.slug} -rt")

    tweets.each do |tweet|
      tweet.media.each do |tweet_media|
        Media.find_or_create_by event_id: event.id, social_id: tweet.id, media_url: tweet_media.media_url.to_s
      end
    end
  end
end
