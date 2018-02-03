flashcards
==========

Writes text or letters over your current an image and sets the wallpaper with `feh`. By default this does not update .fehbg with the new image so you can try new flashcards.

## Usage:
Get help:
```
$ bash do.sh
```
Set hiragana with a black background:
```
$ bash do.sh -a array/hiragana.sh
```

Set hiragana with provide background:
```
$ bash do.sh -a array/hiragana.sh -b ~/wallpaper.jpg
```

Set hiragana with provided background and size for bigger font to 2 (is a ration of sorts for now).
```
$ bash do.sh -a array/hiragana.sh -b ~/wallpaper.jpg -S 5
```

Set hiragana with feh options and wallpaper set on .fehbg
```
$ bash do.sh -a array/hiragana.sh -f -S 5
```
