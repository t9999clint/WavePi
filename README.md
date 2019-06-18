# WavePi
Multifuntion synth platform for Raspberry Pi and other single board computers.

Project page... https://www.retroimperfections.com/wavepi/

Discussion Forum... https://www.vogons.org/viewtopic.php?f=62&t=65908&sid=f9c2322b56f35e529f512d1f13d20b6a


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


There are no installation instructions yet as this project isn't quite at that stage yet.
If you want to use this project, you still can, but keep in mind that you'll probably have to read the code (there isn't much to read), and fill in the blanks on whatever system you want to get this running on.
