---
layout: post
title: "How this Blog is hosted and thoughts on speed"
category: thoughts
---

Browsers are really good at rendering content, like really good. They are so good that we send megabytes of HTML and JavaScript and they handle rendering and manipulating content at over 60 frames per second. 
 
So I was thinking, why are most blogs or content sites paginated? Seems like it's not better. It's much easier to scroll and consume content, rather than have to paginate or lazy load. So then why not just have a long list of content that's scrollable? My sense is that it's too slow to read from whatever datastore, process the content and send it to the browser.

So I'm trying something different. This blog is built on Jekyll, which is awesome, it processes template files and produces a static HTML site. I built a quick plug-in so that it copies my markdown files from IAWriter to it's src directory. Then, with a quick deploy script it builds the Jekyll site and git pushes the site to GitHub Pages. 

Two small optimizations I added from there, and to ensure that it'll really never go down, I'm using CloudFlare as a CDN with Let's Encrypt, all seamless and reliable.

So why is this related to speed? Because in this case with simple css and little javascript, it's incredibly cheap to serve unpaginated content lists to the browser many times under 40 ms. In the future if needed, I can add more async behavior and will likely just use some light JavaScript and/or cloud functions to augment the page.

Happy scrolling!


