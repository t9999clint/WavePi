EESchema Schematic File Version 4
LIBS:WavePi-hat-cache
EELAYER 29 0
EELAYER END
$Descr A3 16535 11693
encoding utf-8
Sheet 1 1
Title "Raspberry Pi HAT"
Date ""
Rev "A"
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L WavePi-hat-rescue:Mounting_Hole-Mechanical H1
U 1 1 5834BC4A
P 5650 6000
F 0 "H1" H 5500 6100 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 5650 5850 60  0000 C CNN
F 2 "project_footprints:NPTH_3mm_ID" H 5550 6000 60  0001 C CNN
F 3 "" H 5550 6000 60  0001 C CNN
	1    5650 6000
	1    0    0    -1  
$EndComp
$Comp
L WavePi-hat-rescue:Mounting_Hole-Mechanical H3
U 1 1 5834BCDF
P 6650 6000
F 0 "H3" H 6500 6100 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 6650 5850 60  0000 C CNN
F 2 "project_footprints:NPTH_3mm_ID" H 6550 6000 60  0001 C CNN
F 3 "" H 6550 6000 60  0001 C CNN
	1    6650 6000
	1    0    0    -1  
$EndComp
$Comp
L WavePi-hat-rescue:Mounting_Hole-Mechanical H2
U 1 1 5834BD62
P 5650 6550
F 0 "H2" H 5500 6650 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 5650 6400 60  0000 C CNN
F 2 "project_footprints:NPTH_3mm_ID" H 5550 6550 60  0001 C CNN
F 3 "" H 5550 6550 60  0001 C CNN
	1    5650 6550
	1    0    0    -1  
$EndComp
$Comp
L WavePi-hat-rescue:Mounting_Hole-Mechanical H4
U 1 1 5834BDED
P 6700 6550
F 0 "H4" H 6550 6650 60  0000 C CNN
F 1 "3mm_Mounting_Hole" H 6700 6400 60  0000 C CNN
F 2 "project_footprints:NPTH_3mm_ID" H 6600 6550 60  0001 C CNN
F 3 "" H 6600 6550 60  0001 C CNN
	1    6700 6550
	1    0    0    -1  
$EndComp
$Comp
L WavePi-hat-rescue:OX40HAT-raspberrypi_hat J2
U 1 1 58DFC771
P 2600 2250
F 0 "J2" H 2950 2350 50  0000 C CNN
F 1 "40HAT" H 2300 2350 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 2600 2450 50  0001 C CNN
F 3 "" H 1900 2250 50  0000 C CNN
	1    2600 2250
	1    0    0    -1  
$EndComp
Text Label 3150 7400 2    60   ~ 0
P3V3
$Comp
L WavePi-hat-rescue:CAT24C32-raspberrypi_hat U1
U 1 1 58E1713F
P 2100 5850
F 0 "U1" H 2450 6200 50  0000 C CNN
F 1 "CAT24C32" H 1850 6200 50  0000 C CNN
F 2 "Package_SO:SOIC-8_3.9x4.9mm_P1.27mm" H 2100 5850 50  0001 C CNN
F 3 "" H 2100 5850 50  0000 C CNN
	1    2100 5850
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 58E17715
P 2350 7400
F 0 "R3" V 2430 7400 50  0000 C CNN
F 1 "3.9K" V 2350 7400 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2280 7400 50  0001 C CNN
F 3 "" H 2350 7400 50  0001 C CNN
	1    2350 7400
	0    1    1    0   
$EndComp
$Comp
L Device:R R4
U 1 1 58E17720
P 2350 7650
F 0 "R4" V 2430 7650 50  0000 C CNN
F 1 "3.9K" V 2350 7650 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 2280 7650 50  0001 C CNN
F 3 "" H 2350 7650 50  0001 C CNN
	1    2350 7650
	0    1    1    0   
$EndComp
Wire Wire Line
	1250 7400 2150 7400
Wire Wire Line
	1250 7650 2150 7650
Wire Wire Line
	2150 7500 1250 7500
Wire Wire Line
	2150 7750 1250 7750
Wire Wire Line
	2150 7750 2150 7650
Connection ~ 2150 7650
Wire Wire Line
	2150 7500 2150 7400
Connection ~ 2150 7400
Wire Wire Line
	2500 7400 2700 7400
Wire Wire Line
	2700 7650 2500 7650
Connection ~ 2700 7400
Text Label 1250 7400 0    60   ~ 0
ID_SD_EEPROM_pu
Text Label 1250 7500 0    60   ~ 0
ID_SD_EEPROM
Text Label 1250 7650 0    60   ~ 0
ID_SC_EEPROM_pu
Text Label 1250 7750 0    60   ~ 0
ID_SC_EEPROM
Wire Wire Line
	3450 6050 2600 6050
Wire Wire Line
	2600 5950 3450 5950
Text Label 3450 5950 2    60   ~ 0
ID_SD_EEPROM_pu
Text Label 3450 6050 2    60   ~ 0
ID_SC_EEPROM_pu
$Comp
L Connector_Generic:Conn_01x02 J1
U 1 1 58E18D32
P 750 6100
F 0 "J1" H 750 6250 50  0000 C CNN
F 1 "CONN_01X02" V 850 6100 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 750 6100 50  0001 C CNN
F 3 "" H 750 6100 50  0000 C CNN
	1    750  6100
	-1   0    0    1   
$EndComp
$Comp
L Device:R R2
U 1 1 58E19E51
P 1550 6250
F 0 "R2" V 1630 6250 50  0000 C CNN
F 1 "10K" V 1550 6250 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1480 6250 50  0001 C CNN
F 3 "" H 1550 6250 50  0001 C CNN
	1    1550 6250
	-1   0    0    1   
$EndComp
Text Label 2400 5350 2    60   ~ 0
P3V3
Wire Wire Line
	2100 5350 2400 5350
Wire Wire Line
	2100 5350 2100 5450
$Comp
L power:GND #PWR02
U 1 1 58E1A612
P 1050 5750
F 0 "#PWR02" H 1050 5500 50  0001 C CNN
F 1 "GND" H 1050 5600 50  0000 C CNN
F 2 "" H 1050 5750 50  0000 C CNN
F 3 "" H 1050 5750 50  0000 C CNN
	1    1050 5750
	1    0    0    -1  
$EndComp
Wire Wire Line
	1300 5650 1300 5750
Wire Wire Line
	1050 5650 1300 5650
Wire Wire Line
	1600 5750 1300 5750
Connection ~ 1300 5750
Wire Wire Line
	1300 5850 1600 5850
$Comp
L power:GND #PWR03
U 1 1 58E1AF98
P 1050 6150
F 0 "#PWR03" H 1050 5900 50  0001 C CNN
F 1 "GND" H 1050 6000 50  0000 C CNN
F 2 "" H 1050 6150 50  0000 C CNN
F 3 "" H 1050 6150 50  0000 C CNN
	1    1050 6150
	1    0    0    -1  
$EndComp
Text Notes 3250 5350 0    60   ~ 0
EEPROM WRITE ENABLE
$Comp
L Device:R R1
U 1 1 58E22900
P 1300 6100
F 0 "R1" V 1380 6100 50  0000 C CNN
F 1 "DNP" V 1300 6100 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric" V 1230 6100 50  0001 C CNN
F 3 "" H 1300 6100 50  0001 C CNN
	1    1300 6100
	0    1    1    0   
$EndComp
Text Notes 1550 7050 0    118  ~ 24
Pullup Resistors
Text Notes 2000 4800 0    118  ~ 24
HAT EEPROM
Text Notes 5300 5700 0    118  ~ 24
Mounting Holes
Text Notes 1650 2000 0    118  ~ 24
40-Pin HAT Connector
Text Label 800  4150 0    60   ~ 0
GND
Wire Wire Line
	2000 4150 800  4150
Text Label 800  3550 0    60   ~ 0
ID_SD_EEPROM
Wire Wire Line
	2000 3550 800  3550
Text Label 800  3450 0    60   ~ 0
GND
Wire Wire Line
	2000 3450 800  3450
Text Label 800  2650 0    60   ~ 0
GND
Wire Wire Line
	2000 2650 800  2650
Text Label 800  2250 0    60   ~ 0
P3V3_HAT
Wire Wire Line
	2000 2250 800  2250
Wire Wire Line
	3200 2850 4400 2850
Wire Wire Line
	3200 3150 4400 3150
Wire Wire Line
	3200 3550 4400 3550
Wire Wire Line
	3200 3650 4400 3650
Wire Wire Line
	3200 3850 4400 3850
Text Label 4400 2850 2    60   ~ 0
GND
Text Label 4400 3150 2    60   ~ 0
GND
Text Label 4400 3650 2    60   ~ 0
GND
Text Label 4400 3550 2    60   ~ 0
ID_SC_EEPROM
Text Label 4400 3850 2    60   ~ 0
GND
Text Label 4400 2450 2    60   ~ 0
GND
Wire Wire Line
	3200 2450 4400 2450
Text Label 4400 2350 2    60   ~ 0
P5V_HAT
Text Label 4400 2250 2    60   ~ 0
P5V_HAT
Wire Wire Line
	2700 7650 2700 7400
Text Notes 1200 5200 0    60   ~ 0
The HAT spec requires this EEPROM with system information\nto be in place in order to be called a HAT. It should be set up as write\nprotected (WP pin held high), so it may be desirable to either put a \njumper as shown to enable writing, or to hook up a spare IO pin to do so.
Text Notes 1100 7250 0    60   ~ 0
These are just pullup resistors for the I2C bus on the EEPROM.\nThe resistor values are per the HAT spec.
Text Notes 850  1250 0    100  ~ 0
This is based on the official Raspberry Pi spec to be able to call an extension board a HAT.\nhttps://github.com/raspberrypi/hats/blob/master/designguide.md
$Comp
L power:GND #PWR04
U 1 1 58E3CC10
P 2100 6350
F 0 "#PWR04" H 2100 6100 50  0001 C CNN
F 1 "GND" H 2100 6200 50  0000 C CNN
F 2 "" H 2100 6350 50  0000 C CNN
F 3 "" H 2100 6350 50  0000 C CNN
	1    2100 6350
	1    0    0    -1  
$EndComp
Wire Wire Line
	2100 6250 2100 6350
Text Label 1800 6550 2    60   ~ 0
P3V3
Wire Wire Line
	1800 6550 1550 6550
Wire Wire Line
	1550 6550 1550 6400
Wire Wire Line
	1450 6050 1550 6050
Wire Wire Line
	1550 6000 1550 6050
Wire Wire Line
	1050 5650 1050 5750
Connection ~ 1300 5650
Wire Wire Line
	1450 6050 1450 6100
Connection ~ 1550 6050
Wire Wire Line
	950  6100 1050 6100
Wire Wire Line
	1050 6150 1050 6100
Connection ~ 1050 6100
Wire Wire Line
	950  6000 1550 6000
Wire Wire Line
	2150 7650 2200 7650
Wire Wire Line
	2150 7400 2200 7400
Wire Wire Line
	2700 7400 3150 7400
Wire Wire Line
	1300 5750 1300 5850
Wire Wire Line
	1300 5650 1600 5650
Wire Wire Line
	1550 6050 1600 6050
Wire Wire Line
	1550 6050 1550 6100
Wire Wire Line
	1050 6100 1150 6100
$Comp
L Device:R R7
U 1 1 5D1C376D
P 13900 2550
F 0 "R7" H 13970 2596 50  0000 L CNN
F 1 "40K" H 13970 2505 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 13830 2550 50  0001 C CNN
F 3 "~" H 13900 2550 50  0001 C CNN
	1    13900 2550
	1    0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D1C3E3E
P 12550 2250
F 0 "R5" H 12480 2204 50  0000 R CNN
F 1 "220" H 12480 2295 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 12480 2250 50  0001 C CNN
F 3 "~" H 12550 2250 50  0001 C CNN
	1    12550 2250
	-1   0    0    1   
$EndComp
$Comp
L Device:R R6
U 1 1 5D1C422C
P 13750 2000
F 0 "R6" H 13820 2046 50  0000 L CNN
F 1 "4K" H 13820 1955 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0204_L3.6mm_D1.6mm_P7.62mm_Horizontal" V 13680 2000 50  0001 C CNN
F 3 "~" H 13750 2000 50  0001 C CNN
	1    13750 2000
	1    0    0    -1  
$EndComp
$Comp
L power:GND #PWR010
U 1 1 5D1C57CC
P 13600 3000
F 0 "#PWR010" H 13600 2750 50  0001 C CNN
F 1 "GND" H 13600 2850 50  0000 C CNN
F 2 "" H 13600 3000 50  0000 C CNN
F 3 "" H 13600 3000 50  0000 C CNN
	1    13600 3000
	1    0    0    -1  
$EndComp
$Comp
L dk_Diodes-Rectifiers-Single:1N4148 D1
U 1 1 5D1DB720
P 12100 2500
F 0 "D1" V 12104 2588 50  0000 L CNN
F 1 "1N4148" V 12195 2588 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" H 12300 2700 60  0001 L CNN
F 3 "https://www.onsemi.com/pub/Collateral/1N914-D.PDF" H 12300 2800 60  0001 L CNN
F 4 "1N4148FS-ND" H 12300 2900 60  0001 L CNN "Digi-Key_PN"
F 5 "1N4148" H 12300 3000 60  0001 L CNN "MPN"
F 6 "Discrete Semiconductor Products" H 12300 3100 60  0001 L CNN "Category"
F 7 "Diodes - Rectifiers - Single" H 12300 3200 60  0001 L CNN "Family"
F 8 "https://www.onsemi.com/pub/Collateral/1N914-D.PDF" H 12300 3300 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/on-semiconductor/1N4148/1N4148FS-ND/458603" H 12300 3400 60  0001 L CNN "DK_Detail_Page"
F 10 "DIODE GEN PURP 100V 200MA DO35" H 12300 3500 60  0001 L CNN "Description"
F 11 "ON Semiconductor" H 12300 3600 60  0001 L CNN "Manufacturer"
F 12 "Active" H 12300 3700 60  0001 L CNN "Status"
	1    12100 2500
	0    1    1    0   
$EndComp
$Comp
L Isolator:6N138 U2
U 1 1 5D1C29FC
P 13000 2500
F 0 "U2" H 13000 2967 50  0000 C CNN
F 1 "6N138" H 13000 2876 50  0000 C CNN
F 2 "Package_DIP:DIP-8_W10.16mm" H 13290 2200 50  0001 C CNN
F 3 "http://www.onsemi.com/pub/Collateral/HCPL2731-D.pdf" H 13290 2200 50  0001 C CNN
	1    13000 2500
	1    0    0    -1  
$EndComp
Wire Wire Line
	13750 1850 13750 1800
Wire Wire Line
	13750 2150 13750 2300
Wire Wire Line
	13750 2600 13300 2600
Wire Wire Line
	13300 2300 13300 1800
Wire Wire Line
	13300 1800 13750 1800
Wire Wire Line
	13300 2400 13900 2400
Wire Wire Line
	13300 2700 13600 2700
Wire Wire Line
	13600 2700 13900 2700
Connection ~ 13600 2700
Wire Wire Line
	12700 2700 12700 2600
Wire Wire Line
	12100 2400 12550 2400
Wire Wire Line
	12700 2400 12550 2400
Connection ~ 12550 2400
Text Label 4400 2650 2    60   ~ 0
TTY_3v3
Wire Wire Line
	3200 2650 4400 2650
Text Label 14350 2300 2    60   ~ 0
TTY_3v3
Wire Wire Line
	13750 2300 14350 2300
Connection ~ 13750 2300
Wire Wire Line
	13750 2300 13750 2600
Text Label 12450 1650 2    60   ~ 0
MIDI_IN
Wire Wire Line
	12550 1650 12550 2100
$Comp
L Connector_Generic:Conn_02x13_Odd_Even J3
U 1 1 5D2290BC
P 13400 4200
F 0 "J3" H 13450 5017 50  0000 C CNN
F 1 "WaveBlaster Connector" H 13450 4926 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x13_P2.54mm_Vertical" H 13400 4200 50  0001 C CNN
F 3 "~" H 13400 4200 50  0001 C CNN
	1    13400 4200
	1    0    0    -1  
$EndComp
Text Label 14250 4100 2    60   ~ 0
Audio_R
$Comp
L power:GND #PWR07
U 1 1 5D2B9A21
P 12650 3750
F 0 "#PWR07" H 12650 3500 50  0001 C CNN
F 1 "GND" H 12650 3600 50  0000 C CNN
F 2 "" H 12650 3750 50  0000 C CNN
F 3 "" H 12650 3750 50  0000 C CNN
	1    12650 3750
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR08
U 1 1 5D2BB0CD
P 12650 4450
F 0 "#PWR08" H 12650 4200 50  0001 C CNN
F 1 "GNDA" H 12655 4277 50  0000 C CNN
F 2 "" H 12650 4450 50  0001 C CNN
F 3 "" H 12650 4450 50  0001 C CNN
	1    12650 4450
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 3750 12950 3750
Wire Wire Line
	12950 3750 12950 3800
Wire Wire Line
	12950 4100 13200 4100
Wire Wire Line
	13200 4000 12950 4000
Connection ~ 12950 4000
Wire Wire Line
	12950 4000 12950 4100
Wire Wire Line
	13200 3900 12950 3900
Connection ~ 12950 3900
Wire Wire Line
	12950 3900 12950 4000
Wire Wire Line
	13200 3800 12950 3800
Connection ~ 12950 3800
Wire Wire Line
	12950 3800 12950 3900
Wire Wire Line
	13200 3700 12950 3700
Wire Wire Line
	12950 3700 12950 3750
Connection ~ 12950 3750
Wire Wire Line
	13200 3600 12950 3600
Wire Wire Line
	12950 3600 12950 3700
Connection ~ 12950 3700
Wire Wire Line
	13200 4300 12950 4300
Wire Wire Line
	12950 4300 12950 4400
Wire Wire Line
	12950 4450 12650 4450
Wire Wire Line
	12950 4400 13200 4400
Connection ~ 12950 4400
Wire Wire Line
	12950 4400 12950 4450
Wire Wire Line
	12950 4450 12950 4500
Wire Wire Line
	12950 4500 13200 4500
Connection ~ 12950 4450
Wire Wire Line
	12950 4500 12950 4600
Wire Wire Line
	12950 4600 13200 4600
Connection ~ 12950 4500
Wire Wire Line
	12950 4600 12950 4700
Wire Wire Line
	12950 4700 13200 4700
Connection ~ 12950 4600
Wire Wire Line
	12950 4700 12950 4800
Wire Wire Line
	12950 4800 13200 4800
Connection ~ 12950 4700
Wire Wire Line
	13600 2700 13600 2950
Wire Wire Line
	12100 2700 12450 2700
Wire Wire Line
	12450 2700 12450 2950
Wire Wire Line
	12450 2950 13600 2950
Connection ~ 12450 2700
Wire Wire Line
	12450 2700 12700 2700
Connection ~ 13600 2950
Wire Wire Line
	13600 2950 13600 3000
$Comp
L dk_Rectangular-Connectors-Headers-Male-Pins:0022232041 J5
U 1 1 5D333AF1
P 14500 1550
F 0 "J5" V 14275 1558 50  0000 C CNN
F 1 "Floppy Power Connector" V 14366 1558 50  0000 C CNN
F 2 "digikey-footprints:PinHeader_1x4_P2.54mm_Drill1.02mm" H 14700 1750 60  0001 L CNN
F 3 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 14700 1850 60  0001 L CNN
F 4 "WM4202-ND" H 14700 1950 60  0001 L CNN "Digi-Key_PN"
F 5 "0022232041" H 14700 2050 60  0001 L CNN "MPN"
F 6 "Connectors, Interconnects" H 14700 2150 60  0001 L CNN "Category"
F 7 "Rectangular Connectors - Headers, Male Pins" H 14700 2250 60  0001 L CNN "Family"
F 8 "https://www.molex.com/pdm_docs/sd/022232041_sd.pdf" H 14700 2350 60  0001 L CNN "DK_Datasheet_Link"
F 9 "/product-detail/en/molex/0022232041/WM4202-ND/26671" H 14700 2450 60  0001 L CNN "DK_Detail_Page"
F 10 "CONN HEADER VERT 4POS 2.54MM" H 14700 2550 60  0001 L CNN "Description"
F 11 "Molex" H 14700 2650 60  0001 L CNN "Manufacturer"
F 12 "Active" H 14700 2750 60  0001 L CNN "Status"
	1    14500 1550
	0    1    1    0   
$EndComp
$Comp
L power:GND #PWR014
U 1 1 5D3378E1
P 15050 1750
F 0 "#PWR014" H 15050 1500 50  0001 C CNN
F 1 "GND" H 15055 1577 50  0000 C CNN
F 2 "" H 15050 1750 50  0001 C CNN
F 3 "" H 15050 1750 50  0001 C CNN
	1    15050 1750
	1    0    0    -1  
$EndComp
Wire Wire Line
	15050 1750 14950 1750
Wire Wire Line
	14600 1650 14950 1650
Wire Wire Line
	14950 1650 14950 1750
Connection ~ 14950 1750
Wire Wire Line
	14950 1750 14600 1750
$Comp
L power:+12V #PWR012
U 1 1 5D341A97
P 14750 1950
F 0 "#PWR012" H 14750 1800 50  0001 C CNN
F 1 "+12V" H 14765 2123 50  0000 C CNN
F 2 "" H 14750 1950 50  0001 C CNN
F 3 "" H 14750 1950 50  0001 C CNN
	1    14750 1950
	-1   0    0    1   
$EndComp
Wire Wire Line
	14600 1850 14750 1850
Wire Wire Line
	14750 1850 14750 1950
$Comp
L power:+3V3 #PWR011
U 1 1 5D35DF44
P 13750 1500
F 0 "#PWR011" H 13750 1350 50  0001 C CNN
F 1 "+3V3" H 13765 1673 50  0000 C CNN
F 2 "" H 13750 1500 50  0001 C CNN
F 3 "" H 13750 1500 50  0001 C CNN
	1    13750 1500
	1    0    0    -1  
$EndComp
Wire Wire Line
	13750 1800 13750 1500
Connection ~ 13750 1800
$Comp
L Connector:AudioJack3 J4
U 1 1 5D39CA8D
P 14400 3000
F 0 "J4" H 14382 3325 50  0000 C CNN
F 1 "AudioJack" H 14382 3234 50  0000 C CNN
F 2 "Connector_Audio:Jack_3.5mm_CUI_SJ1-3533NG_Horizontal_CircularHoles" H 14400 3000 50  0001 C CNN
F 3 "~" H 14400 3000 50  0001 C CNN
	1    14400 3000
	1    0    0    -1  
$EndComp
$Comp
L power:GNDA #PWR015
U 1 1 5D3A39CF
P 15250 3000
F 0 "#PWR015" H 15250 2750 50  0001 C CNN
F 1 "GNDA" H 15255 2827 50  0000 C CNN
F 2 "" H 15250 3000 50  0001 C CNN
F 3 "" H 15250 3000 50  0001 C CNN
	1    15250 3000
	1    0    0    -1  
$EndComp
Wire Wire Line
	14600 3000 15100 3000
Wire Wire Line
	15100 3000 15100 4100
Wire Wire Line
	13700 4100 15100 4100
Text Label 14250 3900 2    60   ~ 0
MIDI_IN
Wire Wire Line
	13700 3900 14450 3900
Wire Wire Line
	14450 3900 14450 3250
Wire Wire Line
	14450 3250 12300 3250
Wire Wire Line
	12300 3250 12300 2850
Wire Wire Line
	12300 2850 11850 2850
Wire Wire Line
	11850 2850 11850 1650
Wire Wire Line
	11850 1650 12550 1650
Wire Wire Line
	14600 2900 15250 2900
Wire Wire Line
	15250 2900 15250 3000
Wire Wire Line
	14600 3100 15000 3100
Wire Wire Line
	15000 3100 15000 4300
Wire Wire Line
	15000 4300 13700 4300
Text Label 14250 4300 2    60   ~ 0
Audio_L
$Comp
L Regulator_Switching:LM2596S-ADJ U3
U 1 1 5D453231
P 13500 5350
F 0 "U3" H 13500 5717 50  0000 C CNN
F 1 "LM2596" H 13500 5626 50  0000 C CNN
F 2 "Package_TO_SOT_SMD:TO-263-5_TabPin3" H 13550 5100 50  0001 L CIN
F 3 "http://www.ti.com/lit/ds/symlink/lm2596.pdf" H 13500 5350 50  0001 C CNN
	1    13500 5350
	1    0    0    -1  
$EndComp
$Comp
L power:+12V #PWR06
U 1 1 5D454B30
P 12500 5250
F 0 "#PWR06" H 12500 5100 50  0001 C CNN
F 1 "+12V" V 12515 5378 50  0000 L CNN
F 2 "" H 12500 5250 50  0001 C CNN
F 3 "" H 12500 5250 50  0001 C CNN
	1    12500 5250
	0    -1   -1   0   
$EndComp
Wire Wire Line
	12500 5250 12650 5250
$Comp
L Device:CP1_Small C1
U 1 1 5D499D84
P 12650 5500
F 0 "C1" H 12741 5546 50  0000 L CNN
F 1 "680uF" H 12741 5455 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 12650 5500 50  0001 C CNN
F 3 "~" H 12650 5500 50  0001 C CNN
	1    12650 5500
	1    0    0    -1  
$EndComp
Wire Wire Line
	12650 5250 12650 5400
Connection ~ 12650 5250
Wire Wire Line
	12650 5250 13000 5250
$Comp
L power:GND #PWR09
U 1 1 5D4BCA75
P 13500 5800
F 0 "#PWR09" H 13500 5550 50  0001 C CNN
F 1 "GND" H 13505 5627 50  0000 C CNN
F 2 "" H 13500 5800 50  0001 C CNN
F 3 "" H 13500 5800 50  0001 C CNN
	1    13500 5800
	1    0    0    -1  
$EndComp
Wire Wire Line
	13500 5800 13500 5750
Wire Wire Line
	13000 5450 13000 5750
Wire Wire Line
	13000 5750 13500 5750
Connection ~ 13500 5750
Wire Wire Line
	13500 5750 13500 5650
$Comp
L Device:D_Schottky_Small_ALT D2
U 1 1 5D4CA46A
P 14150 5600
F 0 "D2" V 14104 5668 50  0000 L CNN
F 1 "IN5824" V 14195 5668 50  0000 L CNN
F 2 "Diode_THT:D_A-405_P10.16mm_Horizontal" V 14150 5600 50  0001 C CNN
F 3 "~" V 14150 5600 50  0001 C CNN
	1    14150 5600
	0    1    1    0   
$EndComp
Wire Wire Line
	14000 5450 14150 5450
Wire Wire Line
	14150 5450 14150 5500
Wire Wire Line
	14150 5700 14150 5750
Wire Wire Line
	14150 5750 13500 5750
$Comp
L Device:L_Small L1
U 1 1 5D4D8D5B
P 14400 5450
F 0 "L1" V 14585 5450 50  0000 C CNN
F 1 "33uH" V 14494 5450 50  0000 C CNN
F 2 "Inductor_THT:L_Radial_L8.0mm_W8.0mm_P5.00mm_Neosid_SD8" H 14400 5450 50  0001 C CNN
F 3 "~" H 14400 5450 50  0001 C CNN
	1    14400 5450
	0    -1   -1   0   
$EndComp
Wire Wire Line
	14300 5450 14150 5450
Connection ~ 14150 5450
Wire Wire Line
	14000 5250 14700 5250
Wire Wire Line
	14700 5250 14700 5450
Wire Wire Line
	14700 5450 14500 5450
$Comp
L Device:CP1_Small C2
U 1 1 5D4E7A61
P 14700 5600
F 0 "C2" H 14791 5646 50  0000 L CNN
F 1 "220uF" H 14791 5555 50  0000 L CNN
F 2 "Capacitor_THT:CP_Radial_D5.0mm_P2.00mm" H 14700 5600 50  0001 C CNN
F 3 "~" H 14700 5600 50  0001 C CNN
	1    14700 5600
	1    0    0    -1  
$EndComp
Wire Wire Line
	14700 5450 14700 5500
Connection ~ 14700 5450
Wire Wire Line
	14700 5700 14700 5750
Wire Wire Line
	14700 5750 14150 5750
Connection ~ 14150 5750
$Comp
L power:+5V #PWR013
U 1 1 5D4F65FB
P 14850 5450
F 0 "#PWR013" H 14850 5300 50  0001 C CNN
F 1 "+5V" V 14865 5578 50  0000 L CNN
F 2 "" H 14850 5450 50  0001 C CNN
F 3 "" H 14850 5450 50  0001 C CNN
	1    14850 5450
	0    1    1    0   
$EndComp
Wire Wire Line
	14850 5450 14700 5450
Text Notes 14200 5150 0    50   ~ 0
12v from Floppy connector\nconverted to 5v for RasPi GPIO\nPin 2
Text Notes 14000 4550 0    50   ~ 0
Audio cable from USB DAC gets\nconnected to WaveBlaster Header on SB16
Text Notes 14200 2550 0    50   ~ 0
MIDI_IN from SB16 gets converted\nto TTY_3.3 for RasPi GPIO\nPin 10 (RXD)
Wire Wire Line
	12650 5600 12650 5750
Wire Wire Line
	12650 5750 13000 5750
Connection ~ 13000 5750
Text Notes 12800 1350 0    50   ~ 0
3.3v power is pulled from\nRasPi GPIO - Pin 1
$Comp
L power:+5V #PWR05
U 1 1 5D60007D
P 4850 2250
F 0 "#PWR05" H 4850 2100 50  0001 C CNN
F 1 "+5V" V 4865 2378 50  0000 L CNN
F 2 "" H 4850 2250 50  0001 C CNN
F 3 "" H 4850 2250 50  0001 C CNN
	1    4850 2250
	0    1    1    0   
$EndComp
Wire Wire Line
	3200 2250 4800 2250
Wire Wire Line
	4800 2250 4800 2350
Wire Wire Line
	3200 2350 4800 2350
Connection ~ 4800 2250
Wire Wire Line
	4800 2250 4850 2250
$Comp
L power:+3V3 #PWR01
U 1 1 5D60EE1D
P 800 2250
F 0 "#PWR01" H 800 2100 50  0001 C CNN
F 1 "+3V3" V 815 2378 50  0000 L CNN
F 2 "" H 800 2250 50  0001 C CNN
F 3 "" H 800 2250 50  0001 C CNN
	1    800  2250
	0    -1   -1   0   
$EndComp
$EndSCHEMATC
