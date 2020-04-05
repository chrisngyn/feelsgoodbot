require 'twitter'
require 'mongo'

keys = File.readlines("tokens.txt") # read environment variables from this text file
bot = Twitter::REST::Client.new do |config| # create instance of Twitter bot (bot.update() = send a tweet!)
    config.consumer_key         = keys[0].chomp
    config.consumer_secret      = keys[1].chomp
    config.access_token         = keys[2].chomp
    config.access_token_secret  = keys[3].chomp
end

client = Mongo::Client.new(keys[4].chomp)
collection = client[:tweets]
tweet = collection.find( { tweeted: false } ).first # find a tweet in the database that hasn't been tweeted yet...

if toTweet.nil? # ...but if there ISN'T one that hasn't been tweeted yet (meaning they ALL have been tweeted)...
    bot.update("Chris is lazy and forgot to fill me with more tweets >:(") # ... then send this default message.
else
    bot.update(toTweet[:tweet]) # ...else, update the tweet in the database to "has been tweeted."
end

result = collection.update_one( { '_id' => toTweet[:_id] }, { '$set' => { 'tweeted' => true } } )