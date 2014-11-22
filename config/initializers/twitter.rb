Twitter::REST::Client.class_eval do
  def self.new(options = {}, &block)
    options[:consumer_key]        ||= Rails.application.secrets.twitter_consumer_key
    options[:consumer_secret]     ||= Rails.application.secrets.twitter_consumer_secret
    options[:access_token]        ||= Rails.application.secrets.twitter_access_token
    options[:access_secret]       ||= Rails.application.secrets.twitter_access_token_secret
    
    super(options, &block)
  end
end
