#!/usr/bin/env python
#
# midiin_callback.py
#
"""Show how to receive MIDI input by setting a callback function."""

from __future__ import print_function

import logging
import sys
import os
from time import sleep
from threading import Thread

import mido

from RPLCD.i2c import CharLCD

class LcdHandler(Thread):
    def __init__(self, rows, cols):
        Thread.__init__(self)
        self.daemon = True
        self.lcd = CharLCD('PCF8574', 0x27, rows=rows, cols=cols)
        self.rows = rows
        self.cols = cols
        self.state_channels = [False, False, False, False, False, False, False, False, False, False]
        self.lcd_states = ["config","channels"]
        self.lcd_blocked = False
        self.current_synth_name = 0
        self.start()

    def get_active_synth_name(self):
        with open(os.path.dirname(os.path.abspath(__file__)) + '/../logs/current-synth-info.log') as f:
            content = f.readline()
            while "RUNNING_SYNTH_NAME" not in content:
                content = f.readline()
            content = content.replace('"','')
            content = content.strip()
            if "PLEASE WAIT" not in content.split('=')[1]:
                return content.split('=')[1]
            else:
                return self.current_synth_name

    def write_center(self, row, string):
        empty_row = ' ' * self.cols
        self.lcd.cursor_pos = (row,0)
        self.lcd.write_string(empty_row)
        string = string.lstrip(' ') #trim the spaces because we center the string ourselves
        string = string.rstrip(' ')
        if (len(string) > self.cols):
            string = string[0:self.cols]
        col = int((self.cols - len(string)) / 2)
        if col < 0:
            col = 0
        self.lcd.cursor_pos = (row,col)
        self.lcd.write_string(string)

    def init_channels(self):
        self.lcd.clear()
        self.write_center(0, self.get_active_synth_name())
        self.lcd.cursor_pos = (1, 0)
        self.lcd.write_string('1 2 3 4 5 R')

    def write_first_line(self, message, state):
        self.lcd_blocked = True
        self.lcd_states[0] = state
        self.lcd.cursor_pos = (0, 0)
        empty_row = ' ' * self.cols
        self.lcd.write_string(empty_row)
        self.lcd.cursor_pos = (0, 0)
        self.write_center(0, message)
        self.lcd_blocked = False

    def turn_channel_on(self, channel):
        if 1 <= channel <= 5:
            self.state_channels[channel] = True
            if not self.lcd_blocked:
                self.lcd.cursor_pos = (1, (channel - 1) * 2)
                self.lcd.write(0xFF)
        elif 5 < channel <= 9:
            self.state_channels[channel] = True
            if any(self.state_channels[6:-1]) and not self.lcd_blocked:
                self.lcd.cursor_pos = (1, 10)
                self.lcd.write(0xFF)

    def turn_channel_off(self, channel):
        if 1 <= channel <= 5:
            self.state_channels[channel] = False
            if not self.lcd_blocked:
                self.lcd.cursor_pos = (1, (channel - 1) * 2)
                self.lcd.write_string(str(channel))
        elif 5 < channel <= 9:
            self.state_channels[channel] = False
            if not any(self.state_channels[6:-1]) and not self.lcd_blocked:
                self.lcd.cursor_pos = (1, 10)
                self.lcd.write_string('R')

    def run(self):
        self.write_center(0, "WavePi")
        self.current_synth_name = self.get_active_synth_name()
        self.write_center(1, self.current_synth_name)
        sleep(2)
        self.init_channels()
        while True:
            sleep(1)
            if self.lcd_states[0] == 'sysex_lcd':
                sleep(3)
                self.write_first_line(self.current_synth_name, 'config')
            elif self.current_synth_name != self.get_active_synth_name():
                self.current_synth_name = self.get_active_synth_name()
                self.write_first_line(self.current_synth_name, 'config')


class MidiInputHandler(object):
    def __init__(self, lcd=None):
        if lcd:
            self.lcd = lcd
            #self.lcd.init_channels()

    def __call__(self, msg, data=None):
        if msg.type == 'sysex':
            if msg.data[0:4] == (0x41, 0x10, 0x16, 0x12):   # MT-32 SysEx message
                if msg.data[4:7] == (0x20, 0x00, 0x00):     # Display message
                    LCD_message = ''.join(chr(i) for i in msg.data[7:-2])
                    lcd.write_first_line(LCD_message.rstrip(),"sysex_lcd")

            elif msg.data[0:2] == (0x66, 0x04):             # WavePi profile change SysEx message
                os.system('wavepi ' + format(msg.data[-1], '03'))
        elif msg.type == 'control_change':
            if msg.control == 123:
                self.lcd.turn_channel_off(msg.channel)
        elif msg.type == 'program_change':
            # do something???
            pass
        elif self.lcd:
            if msg.type == 'note_on':
                self.lcd.turn_channel_on(msg.channel)
            elif msg.type == 'note_off':
                self.lcd.turn_channel_off(msg.channel)

# read config file
with open(os.path.dirname(os.path.abspath(__file__)) + '/../configs/main.cfg') as f:
    content = f.readlines()
content = [x.strip() for x in content]
content = [x for x in content if x != '']
content = [x for x in content if x[0] != '#']
content = [x.split('=') for x in content]

#convert config to dict
config = dict()
for element in content:
    config[element[0]] = element[1]

if config['LCD'] == 'true':
    lcd = LcdHandler(int(config['LCD_ROWS']), int(config['LCD_COLS']))
else:
    lcd = None

try:
    #midiin = rtmidi.MidiIn()
    port = mido.open_input(callback=MidiInputHandler(lcd))
    #port_name = midiin.open_virtual_port("MidiSniffer")
    #midiin.ignore_types(sysex=False)
except (EOFError, KeyboardInterrupt):
    sys.exit()

print("Attaching MIDI input callback handler.")
#midiin.set_callback(MidiInputHandler(port_name, lcd))

print("Entering main loop. Press Control-C to exit.")
try:
    # Just wait for keyboard interrupt,
    # everything else is handled via the input callback.
    while True:
        sleep(1)
except KeyboardInterrupt:
    print('')
finally:
    print("Exit.")
    port.close()
    del port
