---
layout: post
title:  "Environment Updates"
date:   2015-10-27 08:48:00
cover: "/img/2.jpg"
---

This morning as I was sitting down with my coffee and contemplating the pending windows updates that happened to have taken my server down for about an hour, (see last post). I got to thinking about my systems startup process.

I'm a major geek, both development and administration. I love designing infrastructure and as I was looking at various parts of my Virtual Environment, I noticed that a lot of it could be consolidated into a single machine.

This will be a real test of containerization! I had an old Gentoo server running Bind9 that resolves all the DNS traffic for my domains. If you are on this site you resolved the hostname via my DNS server.

I found a Bind9 docker container, someone named "[Factual](https://github.com/Factual/docker-bind9)" has already done all the work for me.

I figured that I may change it a bit, so I forked the repo and set it up. Following his instructions, I found that there was a slight issue with permissions that I had to resolve.

The ENTRYPOINT now changes the owner of the bind directory to the bind user, I'm not sure how Fractual had it set up on his machine, but my configs came over as root:root and I had no bind users on my docker host. I could have chmod 666 but I didn't want to do that, so when I start the container it takes ownership of the files.

    ENTRYPOINT chown -R bind:bind /etc/bind/ && /usr/sbin/named -g -c /etc/bind/named.conf -u bind

Anyways, the new docker container has replaced a VM with 1GB and 2CPUs and replaced it with a single process that runs in 5MB of RAM.

This is why I love containerization, infrastructure consolidation at its best!

How do I test this before I make the port mapping change to point 53 UDP to this container?

I performed a query to lookup the bind version number.

My old server reported 9.9.2, so when I remapped the port and saw 9.9.5 I knew everything worked the way it should have, I queried for my domains and everything was returning correctly.

You perform an nslookup with the following settings:

    >set type=txt
	>set class=chaos
	>server aluitink.io
	>version.bind
	Server:  aluitink.io
    Address:  71.90.91.111

    version.bind    text = "9.9.5-3ubuntu0.5-Ubuntu"
    version.bind    nameserver = version.bind

I find it amazing that on a whim, I ported my DNS configuration to a new host in a matter of minutes and experienced 0 issues (except the permissions thing, easy enough).

The only thing I need to do now is build up a docker-compose that is my production environment in the event I need to quickly start all these containers.