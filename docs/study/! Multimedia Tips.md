## Screenrecording with audio
Select the ==aggregated== audio when doing screen recording. Set up ==aggregated audio== see [video](https://www.youtube.com/watch?v=HRwuyPZ4nBM) here.

## Convert video into gif

[https://gist.github.com/dergachev/4627207](https://gist.github.com/dergachev/4627207)

```
ffmpeg -i "Screen Recording 2021-05-17 at 10.29.22.mov" -pix_fmt rgb24 -r 10 -f gif - | gifsicle --optimize=3 --delay=3 > out.gif
```

