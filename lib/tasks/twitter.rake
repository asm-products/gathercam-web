namespace :twitter do
  task :media, [:event_id] => :environment do |t, args|
    event = Event.find_by(slug: args[:event_id])

    loop do
      @client ||= Twitter::REST::Client.new
      tweets = @client.search("##{event.slug} -rt")

      tweets.each do |tweet|
        tweet.media.each do |tweet_media|
          if !tweet.as_json['retweeted']
            media = Media.where(event_id: event.id, media_id: tweet_media.id).first_or_initialize
            unless media.persisted?
              media.update(media_url: tweet_media.media_url.to_s, text: tweet.as_json['text'])
            end
            puts tweet_media.media_url.to_s
          end
        end
      end

      sleep 5
    end
  end
end
