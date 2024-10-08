# macOS

## Keyboard-only operation

<https://gist.github.com/lornajane/3892c39098cf70baa9c7a1874cddf233>

## Prevent sleep

```sh
caffeinate
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

## Rebuild Finder "Open With" menu

```sh
/System/Library/Frameworks/CoreServices.framework/Versions/A/Frameworks/LaunchServices.framework/Versions/A/Support/lsregister -kill -r -domain local -domain user;killall Finder
```

## Clear icon cache

```sh
sudo rm -rfv /Library/Caches/com.apple.iconservices.store; sudo find /private/var/folders/ \( -name com.apple.dock.iconcache -or -name com.apple.iconservices \) -exec rm -rfv {} \; ; sleep 3;sudo touch /Applications/* ; killall Dock; killall Finder
```


## Fix missing thumbnails or all applications failing to launch due to being "damaged or incomplete"

For missing thumbnails, ensure Finder is actually configured to show previews (View->Show Preview) .

1. Reboot in Recovery Mode (hold ⌘+R when rebooting)
2. Navigate to `/Volumes/.../private/var/folders` and delete its contents
3. Reboot in Safe Boot (hold Shift while booting)
4. Confirm that everything works and reboot normally

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

## Setup multi-user Homebrew

```sh
sudo dscl . create /Groups/brew
sudo dscl . /Groups/brew GroupMembership alice bob
sudo chgrp -R brew $(brew --prefix)/*
sudo chmod -R g+w $(brew --prefix)/*
brew doctor
```
