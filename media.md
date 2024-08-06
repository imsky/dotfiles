# Media

## Create a GIF from video

```sh
vid2gif () {
fps=${2:-24}
bn=$(basename $1)
pf="/tmp/$bn_palette.png"
ffmpeg -y -i $1 -vf "fps=$fps,palettegen" $pf
ffmpeg -i $1 -i $pf -filter_complex "fps=$fps,paletteuse" -f gif - > "$1.gif"
}
```

## Download YouTube video as MP3

```sh
yt-dlp --format bestaudio --extract-audio --audio-format mp3 --audio-quality 320k --embed-thumbnail -o '%(title)s.%(ext)s' https://www.youtube.com/watch?v=mUQHGpxrz-8
```
