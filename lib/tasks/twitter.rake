namespace :twitter do
  task :media, [:event_id] => :environment do |t, args|
    event = Event.find_by(slug: args[:event_id])

    loop do
      @client ||= Twitter::REST::Client.new
      tweets = @client.search("##{event.slug} -rt")

      tweets.each do |tweet|
        tweet.media.each do |tweet_media|
          Media.where(event_id: event.id, media_url: tweet_media.media_url.to_s).first_or_create
          puts tweet_media.media_url.to_s
        end
      end

      sleep 5
    end
  end
end
