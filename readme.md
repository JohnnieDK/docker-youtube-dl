This container was created to keep running in the background.  
Remote into it, and download the file you specify.  
Youtube-dl will then choose the best mp4 it can find and merge it with the best audio (usually up to 1080p).  
And download the file to your drive that is mapped (in thise case on windows c:\temp). 


**Start container:**

docker run -d --name yt -v c:\temp:/video youtube-dl


**Enter container:**

docker exec -it yt sh


**Download in container**

$>youtube-dl youtubeurl




[youtube-dl](https://yt-dl.org)
