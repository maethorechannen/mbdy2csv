mbdy2csv - convert BODYDATA.TXT to CSV
======================================

mbdy2csv converts BODYDATA.TXT files from a Salter MiBody scale to CSV.

The file format decoding is based on the work of [the opensaltermibody project](http://code.google.com/p/opensaltermibody/ "opensatermibody project hosted on GoogleCode"). 

This is a simple command line app that just converts the data that is held in a BODYDATA.TXT file (which isn't actually a text file) into a CSV file. No calculations on the data are made (such as converting values to non-metric equivalents, or BMI/BMR/Body Water values. About the only "processing" done on the input is that padding data is removed.

Compiling
---------

mbdy2csv is a single vala source file. Compiling is as simple as

valac --pkg gio-2.0 -o mbdy2csv mbdy2csv.vala 

Usage
-----

./mbdy2csv BODYDATA.TXT

Output is sent to standard out and is very simple:

user,year,month,day,hour,minute,second,gender,age,height,weight,fat,musle mass,visceral fat

Height is in centimeters. Weight appears to be in hectograms (yes, hectograms).

License
-------

GPL V3
