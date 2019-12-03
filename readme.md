Container created with defaults to download and merge with best mp4 settings..  (not 4k)
and map to c:\temp

**Start container:**
docker run -d  --name yt -v c:\temp:/video youtube-dl:1

**Enter container:**
docker exec -it yt sh

$>youtube-dl youtubeurl

