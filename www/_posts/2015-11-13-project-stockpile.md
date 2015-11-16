---
layout: post
title:  "Project Stockpile"
date:   2015-11-13 09:46:00
cover: "/img/2.jpg"
---


Let's talk work for a minute.

With all the time and effort I've put into getting ready to relocate, I have been itching for development projects. Ojibwe is coming along nicely, I've recently redefined the SDK to be easier to use. I was bored one morning and wanted to do something simple, so I did a live development web cast on "Building a ASP.NET 5 Storage Service".

It took a total of 8 hours to build the proof of concept. I've benchmark tested it and it is very fast and very simple. CRUD REST interface to a file store.

Currently it works like this:

POST - Create new data object. Returns 200 OK and GUID.
GET - Retreive existing data object. Takes GUID. Returns 200 OK or 404 NotFound.
PUT - Update existing data object. Takes GUID. Returns 200 OK or 404 NotFound.
DELETE - Delete existing data object. Takes GUID. Returns 200 OK or 500 if exception is thrown.

The service has a tiny built in object database I created using Apache Lucene, called Lucandrew. This allows me to map the file storage key to the GUID and lookups are very fast.

Stockpile is a micro-service, something small, lightweight and scalable, and easy to maintain.

I would like to do the following:

Support Authentication/Authorization, possibly with a simple header or password in the query string.
Build more storage adapters (Dropbox, AmazonS3, Azure, ect).
Write more tests.
Build a .NET SDK for those who want a clean interface for the application.

Extra:

Integrate with Objibwe.

Part 1:
<iframe width="560" height="315" src="https://www.youtube.com/embed/GL02gtGDP4Y" frameborder="0" allowfullscreen></iframe>

<br>

Part 2:
<iframe width="560" height="315" src="https://www.youtube.com/embed/FMAMgnw1cJI" frameborder="0" allowfullscreen></iframe>