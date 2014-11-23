FROM microsoft/aspnet
# copy the contents of the local directory to /app/ on the image
ADD HelloMvc.tar /app/
#COPY project.json /app/
#COPY Startup.cs /app/
#ADD /Controllers/HomeController.cs /app/Controllers/
#COPY ./Models/User.cs /app/Models/
#COPY ./Views/Home/* /app/Views/Home/
#COPY ./Views/Shared/* /app/Views/Shared/

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
