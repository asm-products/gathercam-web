namespace :facebook do
  task :media, [:event_id] => :environment do |t, args|
    event = Event.find_by(slug: args[:event_id])

    loop do
      @graph = Koala::Facebook::API.new(ENV['FACEBOOK_TOKEN'])
      posts = @graph.search("##{event.slug}")

      puts posts.count

      posts.each do |post|
        if post['picture'].present?
          media = Media.where(event_id: event.id, media_id: post['id']).first_or_initialize
          unless media.persisted?
            media.update(media_url: post['picture'], text: post['message'])
          end
          puts post['message']
        end
      end

      sleep 5
    end
  end
end
