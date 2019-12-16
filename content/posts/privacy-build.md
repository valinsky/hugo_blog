---
title: Privacy Build 2020
date: 2019-11-14T23:04:35-05:00
draft: true
description: Privacy Build 2020
keywords: privacy, blog
url: /posts/privacy-build-2020/
toc: false
images:
tags:
  - privacy
  - blog
---

Privacy was a hot topic in the last decade. And for good reason. A lot of companies are thriving based on the business model of gathering as much data as they can from their customers and using that data to gain influence and to generate profit.

Companies started employing intelligent and invasive tracking methods to gather user data and are wordsmiths at hiding the underlying techniques used. A lot of people have no idea how their data is being used, or that they themselves have become a product.

### Online tracking has become an art

#### Free apps

Companies may offer top notch web and mobile apps to customers *for free*. Google, Facebook, Instagram, Twitter are some of the obvious examples. Everything you do while using these apps is recorded and saved in a centralized database forever. The saved data may be used for targeted ads, tracking your online activity, [profiling you](https://www.encyclopedia.com/books/educational-magazines/online-profiling), [influencing your political views](https://en.wikipedia.org/wiki/Facebook%E2%80%93Cambridge_Analytica_data_scandal) etc.

#### Cookies

When you visit a website, a [cookie](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies) with a unique identifier is set on your device. Next time you visit the same website, that cookie is sent in the request and the website knows that you visited it before. While cookies do offer some benefits, like session management, they are heavily used for tracking and profiling.

#### Device fingerprinting

When you're online, websites and apps have access to a wide range of properties specific to your device, like your OS version, system language, system resolution, installed fonts, screen size, browser version, and many more.

Your [device fingerprint](https://pixelprivacy.com/resources/browser-fingerprinting/) is the unique set of these properties.

You might be the only person who visits a particular website from a particular device set to a particular language, with a particular screen size, and using a particular web browser version. Your identity can be easily revealed based on this data, without you revealing any personal information.

You can check your device fingerprint [here](https://panopticlick.eff.org/).  
Check out [this answer](https://meta.stackexchange.com/a/331963) on Stack Exchange for more info.

### First party and third party trackers

First party trackers are trackers employed by the website you visit. Third party trackers are trackers employed by entities other than the website you visit. If there is a third party tracker on a web page, that tracker has the ability to invite any number of other third party trackers.

For example, if you go to *nytimes.com*, NY Times will log your visit, know which article you read, etc.

We can see that NY Times employes other third party trackers to gather your personal information as well, namely Google and Amazon trackers.

{{< figure src="/images/privacy_build/nytimes_trackers.png" title="NY Times Online Trackers" caption="NY Times Online Trackers" position="center" >}}

#### Promotions

I'm seeing more and more companies trying to get my phone number or my email through *free* gift cards, coupons etc. Trader Joe's was giving me a $5 dollars coupon if I signed up for their offer using my phone number.  
They can then use my email or phone number to match it to the profile they have on me.

#### Only scratching the surface

These are just a few examples of different tracking methods. Companies spend big budgets on figuring out better ways to track us. The more data they have on us, the more money they make, the more power and influence they have.

For a deep dive into how exactly our data is being gathered and used by corporations and governments, I highly recommend reading [Permanent Record](https://en.wikipedia.org/wiki/Permanent_Record_(autobiography)) by Edward Snowden.

### Encryption is our friend

>In this way, people can oppose their will to that of a fully mobilized superpower and win. Encryption is an embodiment of the laws of physics, and it does not listen to the bluster of states, even transnational surveillance dystopias.

* Julian Assange in [Cypherpunks: Freedom and the Future of the Internet](https://en.wikipedia.org/wiki/Cypherpunks_(book))

Neither big corporations nor governments can crack **properly implemented** encryption.

I'm a fan of [zero-knowledge proof](https://en.wikipedia.org/wiki/Zero-knowledge_proof) encryption, where data is encrypted before it is sent to servers, and the key to decrypt the data is only available to the user. The key is never stored on company servers. Nobody, not even companies, can decrypt the data. Only the user.

### Privacy build

I'm going to list the apps that I started using that promote encryption and privacy. While this list is by no means exhaustive, and while better alternatives may exist, it can serve as an intro into the world of privacy focused apps.

#### Browser and extensions
tor fun fact, youll be greeted with this message if you maximize your browser window

#### Instant Messaging

#### Email

#### Search Engine

#### Notes

#### Password Manager

#### 2 Factor Authentication

#### OS















> "Arguing that you don't care about the right to privacy because you have nothing to hide is no 
> different than saying you don't care about free speech because you have nothing to say." 

- Edward Snowden


I try not to become dependend on one ecosystem. Google, Apple. I don't agree with monopolizing a specific domain. I believe in competition.