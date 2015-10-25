---
layout: post
title:  "Modifications and Customizations"
date:   2015-10-25 13:35:00
cover: "/img/2.jpg"
---
Let's talk about this site for a minute, to give credit where credit is due.

This site is a clone of [material by naveenshaji](https://github.com/naveenshaji/material). I picked it because it was one of the best (and first) Material Design templates I could find.

After cloning this site, the first thing I did was remove any content from the original creator, sorry bud, but I'm making this mine now.

After I cleared some stuff out, I made a few minor stylesheet adjustments and added a circular picture of myself on at the top of the site. I used pure CSS for that one.

{% highlight css %}
.profile-circular{
 width: 400px;
 height: 400px;
 background-image: url('/img/profile.jpg');
 background-size: cover;
 display: block;
 border-radius: 200px;
 -webkit-border-radius: 200px;
 -moz-border-radius: 200px;
 margin: 0 auto;
}
{% endhighlight %}

I'm not a web designer and I really know little about how to generate a layout. I'm generally ok at finding what needs to change and figuring out how to change it but it always feels like a big waste of time.

![Style Sheet Hell][csshell]

I am much better at application design than visual design, so when it comes to web any shortcuts I can take to get a good looking finished product, will be taken.

Plus he released this under MIT License so, I have to say thank you very much!

After the minor changes to the stylesheet, I found a new font that I thought looked a little better than the one Material Design uses. It is called [Junction Regular](http://www.fontsquirrel.com/fonts/junction-regular).

It was easy enough to get the font working and change the colors, but I had to pull a lot of neat stuff out of the site because it appears to still be a prototype.

There are usually share and comment section on this part of the blog. I'll probably go with [Disqus](https://disqus.com/) as I'm not sure how a static content site would be able to provide a comments section.

So this is the first version of the site. It is pretty simple but again, just meant as a portfolio of my work and skills.

[csshell]: /img/css.gif "Style Sheet Hell"