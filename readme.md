This container was created to keep running in the background.  
Remote into it, and download the video you specify.  
Youtube-dl will then choose the best mp4 it can find and merge it with the best audio (usually up to 1080p).  
And download the file to your drive that is mapped (in thise case on windows c:\temp). 


**Start container:**
~~~bash
docker run -d --name yt -v c:\temp:/video bladedk/youtube-dl
~~~

**Enter container:**
~~~bash
docker exec -it yt sh
~~~

**Download video once inside the container**  
~~~bash
youtube-dl youtubeurl
~~~
  
  
You can download the container on [dockerhub](https://hub.docker.com/r/bladedk/youtube-dl/)



[youtube-dl](https://yt-dl.org)

vers: youtube-dl 2021.02.04.1
