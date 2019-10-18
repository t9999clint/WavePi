# WavePi
## Multifuntion synth platform for Raspberry Pi and other single board computers.

### Project page... https://www.retroimperfections.com/wavepi/

### Discussion Forum... https://www.vogons.org/viewtopic.php?f=62&t=65908


WavePi aims to be a Open Source, all in one synth solution for older PCs that lack the grunt to use modern synthesizer software.

Meant mainly to be a drop-in replacement for a Waveblaster daughterboard for a SoundBlaster card for the 90’s, however it can also be configured for several different uses. You can connect to any Midi port, or even through serial to the host machine.
This device can also act as a standalone synth in a professional music stack. Plug it into a Midi Keyboard or Guitar and use it to rock out!

I use it to play old games on my MS-DOS pc with improved music, but I also built one for my Mom to practice piano with on a old 90’s Yamaha Midi keyboard I found at goodwill. (My synth sounds far more realistic than the built in synth)
I decided to keep the project 100% open source in hopes that this project will continue on long after I am no longer able to work on it.

The components required for this are simple.
1. Small computer running Linux (preferably debian). 1gb ram or greater is strongly recommended for best results.
2. Midi interface of some kind (USB, Serial, etc…)
3. DAC of some kind to pump out the audio with
4. Something to send it Midi data with (MS-DOS games, Midi Instrument, etc…)

The hardware I am developing this project with is as follows…
1. Raspberry Pi 3B+ running Raspbian.
2. Serial 2 Midi interface wired into Waveblaster header on MS-DOS PC
3. USB DAC plugged into the Ras Pi
4. Intel 486 DX2 PC running MS-DOS 6.22 and a Soundblaster 16 with the Rasp Pi wired into it for Midi Data and power.

I will be making a rasbian image for the ras pi 3, but I want to add a few more features first.

### The installation instructions are as follows, keep in mind that the project is in beta state right now.
1. Install debian based os on your synth device. For Raspberry Pi's I strongly recommend raspbian lite (no gui = more ram)
2. (OPTIONAL) I highly recommend enabling openssh-server so you can remotly manage the files and whatnot using putty and filezilla -- **sudo apt install openssh-server -yy && sudo systemctl enable ssh**
3. (OPTIONAL)update rasbian to latest firmware and whatnot. -- **sudo rpi-update**
4. Update other packages -- **sudo apt update && sudo apt upgrade -yy && reboot**
5. configure audio levels -- **alsamixer**
6. (optional, but **_STRONGLY_** recommended) change default password for pi user. -- **passwd**
7. Use wget to download latest WavePi release -- **wget https://github.com/t9999clint/WavePi/archive/v0.8.1.tar.gz**
8. use tar to extract the archive -- **tar xzf v0.8.1.tar.gz**
9. rename extracted folder to WavePi -- **mv WavePi-0.8.1 WavePi** 
10. change to WavePi directory -- **cd WavePi**
11. make it executable -- **chmod +x ./install.sh**
12. run install-munt.sh as root to compile and install munt to your system. Go get some coffee this will take a bit. -- **sudo ./install.sh**
13. copy over soundfonts and munt rom files to appropriate folders using filezilla or something.
14. change to the configs subfolder -- **cd ../configs**
15. use aplay to get your alsa device number. -- **aplay -l**
16. edit main.cfg file and modify the device numbers to match your hardware -- **nano main.cfg**
17. edit the 000.cfg and modify the soundfont settings to match the soundfont you downloaded. -- **nano 000.cfg**
18. (optional) create more config files by copying the 000.cfg and configure them for other soundfonts. -- **cp 000.cfg 003.cfg**
19. reboot -- **sudo reboot**

Now there are two ways to control WavePi, either by using the wavepi command, or by sending it special sysex messages.

## WavePi command syntax
- **wavepi 000 :**
   By entering in a 3 digit number it will attempt to load a config file matching that number in the sonfigs folder. if no file is found it will attempt to load the default config instead (usually 000.cfg).
- **wavepi configfile.cfg :**
   By entering a config file, must have .cfg as an extention and contain no spaces in it's filepath/name, wavepi will load that instead of using a numbered config in the config folder.
- **wavepi soundfont.sf2 :**
   By entering a .sf2 file, wavepi will start it up using the soundfont.sh script. (all files cannot contain spaces in it's name or folder path)
- **wavepi stop :**
   By entering this command, wavepi will check what synth is currently running and stop it using the pkill -P PID command. (please note that the script is smart enough to only allow one synth to run at a time, if you start a synth while one is already running, it'll stop the currently running one first)
  
## WavePi Sysex messages.
- These messages are using the same format as the ones that Falcosoft MidiPlayer uses. **F0 66 04 00 F7** is for config 000, **F0 66 04 09 F7** is for config 009 (there is currently a bug that limits this to only 000-009)
- This can be sent from MS-DOS using this script... https://downloads.kor.ninja/Music/wavepi/sysex.zip
