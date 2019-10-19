# feelsgoodman-twitter-bot
Sometimes the course of life can be overwhelming, and you forget to do basic everyday tasks like remembering to eat breakfast, to take out the trash, to floss your teeth, and more. Everyday my bot (@feelsgoodbot) will send out a tweet to make sure you remember to live your best life!

# Setup
**tokens.txt** is where you add your four API keys.  
  
In your Gemfile, make sure you have **require 'twitter'** and remember to run the command **gem install twitter**.  
  
**twitterBot.txt** is where you load your tweets onto, after it grabs a tweet it will append the word "TWEETED" at the end of the line so that it doesn't tweet the same line again.
