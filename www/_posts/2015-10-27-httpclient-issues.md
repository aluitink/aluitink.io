---
layout: post
title:  "HttpClient Issues"
date:   2015-10-27 09:40:00
cover: "/img/2.jpg"
---

I'm having some odd HttpClient issues with Ojibwe when running my benchmarking application. It seems that every now and then the request method, as parsed by the server shows up as ""POST with two double quotes in front of it.

I'm working around the issues with this middleware shim... but this is a bit rediculous.

{% highlight csharp %}

public class ErrorLoggingMiddleware
{
	private readonly RequestDelegate _next;
	private readonly ILogger _logger;

	private List<string> goodVerbs = new List<string>() { "POST", "PUT", "GET", "DELETE" };

	public ErrorLoggingMiddleware(RequestDelegate next, ILoggerFactory loggerFactory)
	{
		_next = next;
		_logger = loggerFactory.CreateLogger<ErrorLoggingMiddleware>();
	}

	public async Task Invoke(HttpContext context)
	{
		try
		{

			if (!goodVerbs.Contains(context.Request.Method))
			{
				Console.WriteLine(context.Request.ToString());
				context.Request.Method = context.Request.Method.TrimStart('"');
			}
			
			await _next(context);
		}
		catch (Exception ex)
		{
			_logger.LogError("An unhandled exception has occurred: "
			+ ex.Message, ex);
			throw; // Don't stop the error
		}
	}
}

{% endhighlight %}

This is all a bit rediculous, and i'm not even sure who is to blame at this point. I'm going to need to devise a number of tests to figure out exactly who is at fault.

Players:
DNX
Kestrel Server
HttpClient

I'm not sure if it is an issue parsing the packet, in which case it would be Kestrels fault, but maybe not Kestrel, maybe it is actually the ASP.NET team (there are now many different people working on various parts of this and no single place to report a bug).

Maybe it is the Clients problem, I did just recently switch to the HttpClient, the reason I don't think it is the client, is because I'm using the same client in unit testing .. but also a different server.. Blah this is going to be fun to figure out!

![Bad Method][badMethod]

I'm going to spin up a container and see if I can reproduce it in Linux.. If all else fails, I need to capture some packets and makes sure they look ok.

[badMethod]: /img/OjibweBadMethod.png "Bad Method"

.. *a few hours later* ..

Well.. I think I figured it out..

It looks like the bug was discovered a few days ago.

[Issue 270](https://github.com/aspnet/KestrelHttpServer/issues/270)

Going to leave it at that :)