Docker running on Windows with ASP.NET vNext Mvc Sample
===============

This is the sample repository that is explained in the blog post:

[http://blogs.msdn.com/b/scicoria/archive/2014/11/23/using-the-docker-client-from-windows-and-getting-aspnet-vnext-running-in-a-docker-container.aspx](http://blogs.msdn.com/b/scicoria/archive/2014/11/23/using-the-docker-client-from-windows-and-getting-aspnet-vnext-running-in-a-docker-container.aspx "Using the Docker client from Windows and getting AspNet vNext running in a Docker Container")


The docker hub repo is here: [https://registry.hub.docker.com/u/cicorias/dockermvcsample2/](https://registry.hub.docker.com/u/cicorias/dockermvcsample2/ "cicorias / dockermvcsample2")

You can run this directly from Docker by running the following command:

> docker run -d -t -p 8080:5004 cicorias/dockermvcsample2

As with any Docker repo, the dependencies will be retrieved automatically, and when done you'll have a AspNet vNext process running with the sample MVC app from the github repo here: [https://github.com/cicorias/dockerMvcSample](https://github.com/cicorias/dockerMvcSample "cicorias / dockerMvcSample")

Here is the Docker file

    FROM microsoft/aspnet:latest
    MAINTAINER Shawn Cicoria "docker@cicoria.com"
    # copy the contents of the local directory to /app/ on the image
    ADD HelloMvc.tar /app/
    
    RUN ls -l
    # set the working directory for subsequent commands
    WORKDIR app
    RUN ls -l
    # fetch the NuGet dependencies for our application
    RUN kpm restore
    # set the working directory for subsequent commands
    # expose TCP port 5004 from container
    EXPOSE 5004
    # Configure the image as an executable
    # When the image starts it will execute the “k web” command
    # effectively starting our web application
    # (listening on port 5004 by default)
    ENTRYPOINT ["k", "kestrel"]