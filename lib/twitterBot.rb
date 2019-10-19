require 'twitter'                                           # import twitter!

keys = File.readlines("tokens.txt")
bot = Twitter::REST::Client.new do |config|                 # read API key lines from tokens.txt file
    config.consumer_key         = keys[0].chomp
    config.consumer_secret      = keys[1].chomp
    config.access_token         = keys[2].chomp
    config.access_token_secret  = keys[3].chomp
end

file = ""
hasBeenTweeted = false

File.open("twitterBot.txt", "r+").each do |line|            # read twitterBot.txt line by line and nab a tweet
    if (!(line.include? "TWEETED") && !hasBeenTweeted)      # make sure the tweet has not already been tweeted before
        bot.update(line)
        file += line.chomp + " TWEETED" + "\n"              # after you tweet a line, append the word "TWEETED" at the end of it
        hasBeenTweeted = true

    else
        file += line
    end
end

if (!hasBeenTweeted)                                        # if out of tweets, default to this message
    bot.update("Chris is lazy and forgot to fill me with more tweets!")
end

File.write("twitterBot.txt", file)                          # write back the changes to the text file