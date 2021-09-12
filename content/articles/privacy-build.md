---
title: Privacy Build 2020
date: 2019-12-22T00:04:35-05:00
lastmod: 2020-02-19T00:04:35-05:00
draft: true
description: Privacy Build 2020
keywords: privacy, blog
url: /articles/privacy-build-2020/
toc: false
# images:
#   - /images/privacy_build/privacy.png
tags:
  - privacy
  - tutorial
---

Privacy was a hot topic in the last decade. And for good reason. Corporations are thriving based on the business model of gathering as much data as they can from their customers and using that data to gain influence and to generate profit.

Companies started employing intelligent and invasive tracking methods to gather as much user data as possible while hiding the underlying techniques implemented through intelligent word play. A lot of people have no idea how their data is being used, or that they themselves have become a product.

### Online tracking has become an art

#### Free apps

Companies may offer top notch web and mobile apps to customers *for free*. Google, Facebook, Instagram, Twitter are some of the obvious examples. Everything you do while using these apps is recorded and saved in a centralized database forever. The saved data may be used for targeted ads, tracking your online activity, [profiling you](https://www.encyclopedia.com/books/educational-magazines/online-profiling), [influencing your political views](https://www.theguardian.com/news/2018/mar/17/cambridge-analytica-facebook-influence-us-election) etc.

<!-- {{< tweet 977559925680467968 >}} -->

Today I saw that Spotify is giving away a *free* Google Home Mini to premium users...

#### Cookies

When you visit a website, a [cookie](https://developer.mozilla.org/en-US/docs/Web/HTTP/Cookies) with a unique identifier is set on your device. Next time you visit the same website, that cookie is sent in the request and the website knows that you visited it before. While cookies do offer some benefits, like session management, they are heavily used for tracking and profiling.

Also, [zombie cookies](https://en.wikipedia.org/wiki/Zombie_cookie).

#### Device fingerprinting

You might be the only person who visits a particular website from a particular device, using a particular OS version, set to a particular language, with a particular screen size, and using a particular web browser. Websites and apps have access to all that data, and more. 

That's your unique [device fingerprint](https://pixelprivacy.com/resources/browser-fingerprinting/). 

Your identity can be easily revealed based on this data, without you revealing any personal information.

You can check your device fingerprint [here](https://panopticlick.eff.org/).  
Check out [this answer](https://meta.stackexchange.com/a/331963) on Stack Exchange for more info.

#### First party and third party trackers

First party trackers are trackers employed by the website you visit. Third party trackers are trackers employed by entities other than the website you visit. If there is a third party tracker on a web page, that tracker has the ability to invite any number of other third party trackers.

For example, if you go to [nytimes.com](https://www.nytimes.com/), NY Times will log your visit, know which article you read, etc.

But... we can see that NY Times employs other third party trackers to gather your personal information as well, namely Google and Amazon trackers.

{{< figure src="/images/privacy_build/nytimes_trackers.png" title="NY Times Online Trackers" caption="NY Times Online Trackers" position="center" >}}

#### Promotions

I'm seeing more and more companies trying to get my phone number or my email through *free* gift cards, coupons etc. Trader Joe's was giving me a $5 dollars coupon if I signed up for their offer using my phone number.  
They can then use my email or phone number to match it to the profile they have on me.

#### Only scratching the surface

These are just a few examples of different tracking methods. Corporations spend big budgets on figuring out better ways to track us. The more data they have on us, the more money they make, the more power and influence they have.

For a deep dive into how exactly our data is being gathered and used by corporations and governments, I highly recommend reading [Permanent Record](https://en.wikipedia.org/wiki/Permanent_Record_(autobiography)) by Edward Snowden.

### Encryption is our friend

> In this way, people can oppose their will to that of a fully mobilized superpower and win. Encryption is an embodiment of the laws of physics, and it does not listen to the bluster of states, even transnational surveillance dystopias.

* Julian Assange - [Cypherpunks: Freedom and the Future of the Internet](https://en.wikipedia.org/wiki/Cypherpunks_(book))

<br>

Neither big corporations nor governments can crack **properly implemented** encryption.

I'm a fan of [zero-knowledge proof](https://en.wikipedia.org/wiki/Zero-knowledge_proof) encryption, where data is encrypted before it is sent to servers, and the key to decrypt the data is only available to the user. The key is never stored on corporate servers. Nobody, not even companies, can decrypt the data. Only the user can.

### Privacy build

I will list some of the apps I started using that promote encryption and privacy. While this list is by no means exhaustive, and while better alternatives may exist, it can serve as an intro into the world of privacy focused apps.

The first thing I recommend doing after you install a new app is to update the privacy settings accorgindly.

<!-- {{< tweet 1207311306614857728 >}} -->

#### Browser

[Firefox](https://www.mozilla.org/en-US/firefox/new/). Mozilla has been advocating privacy for a while, and lately they stepped their game up. Their open source browser automatically blocks trackers and you can install a wide range of privacy based addons.

I'm using [Privacy Badger](https://addons.mozilla.org/en-US/firefox/addon/privacy-badger17), [Facebook Container](https://addons.mozilla.org/en-US/firefox/addon/facebook-container/), [DuckDuckGo Privacy Essentials](https://addons.mozilla.org/en-US/firefox/addon/duckduckgo-for-firefox/) and [uBlock Origin](https://addons.mozilla.org/en-US/firefox/addon/ublock-origin/) as tracker blocking addons.

[Cookie Quick Manager](https://addons.mozilla.org/en-US/firefox/addon/cookie-quick-manager/) for managing local cookies. I try to delete them after every session.

[HTTPS Everywhere](https://addons.mozilla.org/en-US/firefox/addon/https-everywhere/) to ensure that web traffic is encrypted.

I also use [Tor Browser](https://www.torproject.org/). I fully support Tor and and their mission.  
Fun fact, if you maximize the Tor Browser, you'll be greeted with this message.

{{< figure src="/images/privacy_build/tor_fingerprint_popup.png" title="Tor Fingerprint Popup" caption="Tor Fingerprint Popup" position="center" >}}

Remember that online fingerprint we were talking about before...

On my smartphone I also use the [DuckDuckGo browser](https://duckduckgo.com/app).

#### Instant Messaging

[Signal](https://www.signal.org/). Open source, minimalist, E2EE.  
The argument against Signal is that your phone number is required. I think it's a fair argument, and Signal is aware of it. But we are diving into anonymity here. Privacy and anonymity are two separate things that should be approached differently.

The reason why Signal asks for your phone number is that it can piggyback on your contact list straight from your phone, instead of storing those contacts on their servers. They seem alergic to storing user sensitive information.

WhatsApp uses the Signal protocol as its encryption algorithm. I would never recommend WhatsApp as a secure and private messaging app though. WhatsApp is owned by Facebook. Facebook wants all your data, your friends data, and your friends friends data.

If WhatsApp is encrypted, then how can Facebook get my data? Fair question. They don't care what you talk about. They care about your metadata.

>Metadata is “activity data.” All the records of all the things you do on your devices and all the things your devices do on their own. Take a phone call, for example: its metadata might include the date and time of the call, the call’s duration, the number from which the call was made, the number being called, and their locations. An email’s metadata might include information about what type of computer it was generated on, where, and when, who the computer belonged to, who sent the email, who received it, where and when it was sent and received, and who if anyone besides the sender and recipient accessed it, and where and when. Metadata can tell your surveillant the address you slept at last night and what time you got up this morning. It reveals every place you visited during your day and how long you spent there. It shows who you were in touch with and who was in touch with you. It’s this fact that obliterates any government claim that metadata is somehow not a direct window into the substance of a communication. With the dizzying volume of digital communications in the world, there is simply no way that every phone call could be listened to or email could be read. Even if it were feasible, however, it still wouldn’t be useful, and anyway, metadata makes this unnecessary by winnowing the field. This is why it’s best to regard metadata not as some benign abstraction, but as the very essence of content: it is precisely the first line of information that the party surveilling you requires.

* Edward Snowden - Permanent Record

<br>

Be mindful of metadata when using the internet. Encryption can't be broken, but a lot of apps leave beind a huge trail of metadata.

#### Email

[ProtonMail](https://protonmail.com/)

[Tutanota](https://www.tutanota.com/)

Simple, encrypted, open source.

There are some differences between the two. For example ProtonMail doesn't encrypt the email subject, while Tutanota does.

#### Search Engine

[DuckDuckGo](https://duckduckgo.com/)

[StartPage](https://www.startpage.com/), anonymity built on top of Google search. Sounds like a good idea on paper...

#### Notes

[Standard Notes](https://standardnotes.org/). I love this app. Open source, encrypted, simple and easy to use and it has great extensions.

I think note taking apps are our most personal apps. We may write down our deepest thoughts and ideas. Imagine other people having full access to your deepest thoughts. I'm looking at you Google Keep.

#### Password Manager

[Bitwarden](https://bitwarden.com/). Simple, secure and open source. The free plan should be fine for most users. The paid plan also offers 2FA codes which I'm gladly using over Google Auth or Authy.

#### VPN

I tried a couple of them and they're all *fine*, although I hold the view that [VPNs don't help with privacy](https://gist.github.com/joepie91/5a9909939e6ce7d09e29). I use them for other purposes. Currently I'm using PIA and the new [Firefox Private Network](https://fpn.firefox.com/) looks nice.

#### OS

I do most of my work on a MacBook Pro, but there are other OSes that focus on privacy.

[Tails OS](https://tails.boum.org/). Private and anonymous OS built on top of Tor. It deletes your entire session at shutdown. Fits on a flash drive.

I heard good things about [Qubes OS](https://www.qubes-os.org/) but I have yet to try it out.

#### Stop using native apps

Smartphones are tracking machines, which makes native apps tracking apps. I stopped using most native apps. A browser, like Firefox and DuckDuckGo, with privacy settings cranked up and regular cookie deletion is good enough.

This approach won't stop your smartphone from tracking you though. It tracks you all the time! See [this](https://youtu.be/VFns39RXPrU?t=3) and [this](https://www.nytimes.com/interactive/2019/12/21/opinion/location-data-democracy-protests.html).

#### Awareness

The views on privacy and privacy focused apps are changing rapidly. We ended up in a situation where our private life means big money for some corporation or for the government. We are being fooled into thinking otherwise.

One might think that Google is a tech company. It's not. [It's an ad company](https://www.investopedia.com/articles/investing/020515/business-google.asp). Most of its revenue comes from paid or targeted ads.

One might think that Facebook is a social media website. It's not. [It's an ad company](https://www.investopedia.com/ask/answers/120114/how-does-facebook-fb-make-money.asp). Facebook primarily makes money by selling advertising space on its platform.

Government entities keep pushing for encryption back doors, few examples being [Apple](https://en.wikipedia.org/wiki/FBI%E2%80%93Apple_encryption_dispute) and [Facebook](https://www.forbes.com/sites/zakdoffman/2019/09/29/whatsapp-backdoorwill-facebook-be-forced-to-break-message-encryption-as-reported/#3007f19c1b38). A back door doesn't mean that the government or the company can view your messages, it means that **anyone** that has access to the master key can view your messages. It's a personal, security and privacy risk.

Our private life, our daily activities, our thoughts and emotions, our likes and dislikes, our political views, our relationships, our own identity is being used against us. Advanced machine learning algorithms in conjunction with our data are being used to influence our behaviour and to make us think and feel in a certain way, in order to conform to big corporations and government agendas. This is next level brain washing. It's not like old TV propaganda. Back then everyone would watch the same generic ads and news. Now it's customized based on individual behaviour. It's personal.

We're being played.

I'm a strong believer in the right for privacy and I support companies and individuals who build applications having privacy as a core foundation.

> "Arguing that you don't care about the right to privacy because you have nothing to hide is no 
> different than saying you don't care about free speech because you have nothing to say." 

- Edward Snowden
