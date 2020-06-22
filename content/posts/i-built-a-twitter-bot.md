---
title: "I Built a Twitter Bot"
date: 2020-06-07T15:15:12-04:00
draft: false
description: Twitter Bot
keywords: twitter, bot, python
url: /posts/i-built-a-twitter-bot/
toc: false
tags:
  - bot
  - twitter
  - python
images:
  - /images/bot/halfbtc.jpg
---

On the 11th of May, 2020, at block height [630.000](https://www.blockchain.com/btc/block/000000000000000000024bead8df69990852c202db0e0097c1a12ea637d7e96d), the 3rd [Bitcoin halving](https://www.bitcoinblockhalf.com/) event happened.

For us Bitcoin nerds this was a huge event, not only because it happens every 4 years or because of its economic implications, but also because it shows the beautiful system that Bitcoin has in place, a system that has been working flawlessly since 2009.

To commemorate this event, I thought about creating a Twitter bot that keeps track of how many blocks are left until the next halving. It seemed like a great weekend project, and I wanted to have my own bot for a while.

### Writing the bot

I wrote the bot in Python.

```python
from bloxplorer import bitcoin_explorer
import tweepy


# API Access Keys
API_KEY = 'api_key'
API_KEY_SECRET = 'api_secret_key'
ACCESS_TOKEN = 'access_token'
ACCESS_TOKEN_SECRET = 'access_token_secret'

HALVING_TIME = 210000  # blocks


def progress_bar(percent: float, length: int = 20) -> str:
    # Return a progress bar: ██████████⣿⣿⣿⣿⣿⣿⣿⣿⣿⣿
    fill = '█'
    bar = '⣿' * length
    return f'{fill * int((percent / 100) * length)}{bar}'[:length]


def tweet(message: str) -> None:
    # Twitter auth
    auth = tweepy.OAuthHandler(API_KEY, API_KEY_SECRET)
    auth.set_access_token(ACCESS_TOKEN, ACCESS_TOKEN_SECRET)
    api = tweepy.API(auth)
    # post to Twitter
    api.update_status(message)


if __name__ == '__main__':
    block_height = int(bitcoin_explorer.blocks.get_last_height().data)
    end_time = HALVING_TIME

    while block_height > end_time:
        end_time += HALVING_TIME
    start_time = end_time - HALVING_TIME
    blocks_left = end_time - block_height
    days_left = (blocks_left * 10) // 1440
    percent = round(((block_height - start_time) * 100) / HALVING_TIME, 2)

    message = f"""🚀🚀🚀🚀 #bitcoin 🚀🚀🚀🚀
{progress_bar(percent)} {percent}%
Blocks left: {blocks_left:,}
Days left: ~{days_left:,}
"""

    tweet(message)

```

The bot uses [Bloxplorer](https://valinsky.me/posts/bloxplorer/) to get the current block height, and then it checks to see how many blocks are left until the next halving. At the time of this writing, the next halving will occur at block height 840.000.

I added an ASCII progress bar to show the progress made in terms of percents. Thought that was a neat thing to have in a tweet.

I'm also calculating the number of days left. This number is an approximation, because I'm using a constant block generation time of 10 minutes, and in reality that is not always the case.

In order to interact with the Twitter API I used [tweepy](https://github.com/tweepy/tweepy).  
First I had to go on Twitter and create a [developer account](https://developer.twitter.com/en/docs/basics/developer-portal/overview) for myself. Then I had to create a [developer app](https://developer.twitter.com/en/docs/basics/apps/overview) which lets me generate the necessary keys to interact with the Twitter API.  
After I got the keys, I used them with Tweepy as seen in the `tweet` function above. With those 4 lines of code I was able to hit the Twitter API to post tweets. Pretty nice.

It's a simple and cute little script, but it does the job.

### Deploying the bot

I wanted the bot to post a tweet every day at a certain time. Enter cloud based cron jobs. Since this is a small pet project, I didn't want to pay for any cloud services. I wanted something simple and free.

Initially I tried using [pythonanywhere.com](https://pythonanywhere.com). It supported python, it had the functionality of scheduling tasks, and it was a freemium service. Exactly what I need.  
After I created an account, uploaded my code and created the scheduled task... it failed. That's because for free accounts [pythonanywhere.com](https://pythonanywhere.com) [whitelists only certain sites](https://www.pythonanywhere.com/whitelist/). My bot uses Bloxplorer to make HTTP calls to the [Blockstream Esplora](https://github.com/Blockstream/esplora/blob/master/API.md) API to get the current block height. Since that API is not whitelisted, the request didn't go through. Bummer!

Next!

I heard a lot of talk about [Heroku](https://www.heroku.com/) during my software engineering career, and now seemed like the perfect time to try it out. Just like [pythonanywhere.com](https://pythonanywhere.com), it had everything I wanted. Again I went through the same song and dance of creating an account, creating an app, pushing my code and scheduling the task with [Heroku Scheduler](https://devcenter.heroku.com/articles/scheduler). This time it worked! Sweet!

### @BtcHalvingTimer

I scheduled the bot to tweet every day at 12:00 AM UTC. I'm excited to see the progress bar fill up while we're slowly approaching the 4th Bitcoin halving.

Here's on of the bot's first tweets, with many more to come, daily.

{{< tweet 1274854981791858689 >}}
