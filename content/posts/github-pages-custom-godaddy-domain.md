---
title: How to configure your Github Pages website with your custom Godaddy domain
date: 2019-11-17T10:54:46-05:00
draft: false
description: How to configure your Github Pages website with your custom Godaddy domain
keywords: godaddy, github, https, tutorial, blog
url: /posts/github-pages-with-custom-godaddy-domain/
toc: false
images:
  - /images/triangle.jpg
tags:
  - godaddy
  - github
  - https
  - tutorial
  - blog
categories:
  - tutorial
---

You can use your own custom domain with [GitHub Pages](https://pages.github.com/), instead of GitHub's **\<username\>.github.io** domain. [This GitHub Pages post](https://help.github.com/en/github/working-with-github-pages/configuring-a-custom-domain-for-your-github-pages-site) covers the domain configuration steps.  
If you bought the domain on GoDaddy, I'm going to show you the exact GoDaddy DNS configuration you need.

Go to your [godaddy.com](https://godaddy.com) domain, and find the *Manage DNS* option.

{{< figure src="/images/github_pages_godaddy_domain/manage_dns_setting.png" title="GoDaddy Manage DNS" caption="GoDaddy Manage DNS" position="center" >}}

Add these settings.

{{< figure src="/images/github_pages_godaddy_domain/github_pages_godaddy_config_good.png" title="GoDaddy DNS configuration" caption="GoDaddy DNS configuration" position="center" >}}

My website is hosted on GitHub under the **valinsky.github.io** domain. You'll have to update the CNAME with your own **\<username\>.github.io** domain.

You'll then be greeted with this message in your GitHub respository's settings, right under the GitHub Pages section.

{{< figure src="/images/github_pages_godaddy_domain/github_pages_https_not_available.png" title="HTTPS Not Available" caption="HTTPS Not Available" position="center" >}}

Like the message says, you have to wait *24 hours* for the internet to magically issue an [HTTPS SSL certificate](https://www.digicert.com/ssl-certificate/) for you.

That was not the case for me.

<br>

### Make sure you unpark your domain

Even though your certificate is not issued, you can still access your website through HTTP.  
Never do that! Never serve your website through HTTP. [Read why.](https://developers.google.com/web/fundamentals/security/encrypt-in-transit/why-https)

When I was setting up my own custom domain for this website, I waited 24 hours, then another 24 hours, and yet another 24 hours, but the certificate wasn't getting issued.

I soon realized the problem was with GoDaddy's DNS configuration.

My initial configuration looked like this.

{{< figure src="/images/github_pages_godaddy_domain/github_pages_godaddy_config_bad.png" title="GoDaddy DNS parked configuration" caption="GoDaddy DNS parked configuration" position="center" >}}

Those two DNS entries were setup by GoDaddy, and I didn't pay much attention to them initially. If you see these in your own DNS configuration, be sure to remove them, or else you'll end up with a [parked domain](https://en.wikipedia.org/wiki/Domain_parking) that won't work with your GitHub Pages setup.

After I removed those entries, a few hours later my HTTPS SSL certificate was issued and I was able to activate it.

{{< figure src="/images/github_pages_godaddy_domain/activate_https.png" title="HTTPS Enforced" caption="HTTPS Enforced" position="center" >}}

And that's it.

Now you have a website hosted by GitHub and configured with your own custom GoDaddy DNS.
