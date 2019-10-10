# macOS

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

## Enable key repeats

```sh
defaults write NSGlobalDomain ApplePressAndHoldEnabled -bool false
```

## Delete Mail preferences

```sh
rm -rf ~/Library/Containers/com.apple.mail ~/Library/Mail/V2/MailData/
```

## Rebuild Spotlight index

```sh
sudo mdutil -a -i off && sudo mdutil -E -i on /
```

## Make bootable ISO USB drive

```sh
hdiutil convert -format UDTO -o image file.iso
diskutil list; disk util unmountDisk /dev/diskX
sudo dd if=image.cdr of=/dev/rdiskX bs=1m
```

## Create a PDF out of images

* Select multiple images, open with Preview
* Choose File->Print and print to PDF

## Password-protect a PDF

* Open a PDF with Preview
* Choose File->Export and toggle "Encrypt"
