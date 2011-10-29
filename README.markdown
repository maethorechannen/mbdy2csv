mbdy2csv - convert BODYDATA.TXT to CSV
======================================

mbdy2csv converts BODYDATA.TXT files from a Salter MiBody scale to CSV.

The file format decoding is based on the work of [the opensaltermibody project](http://code.google.com/p/opensaltermibody/ "opensatermibody project hosted on GoogleCode"). 

This is a simple command line app that just converts the data that is held in a BODYDATA.TXT file (which isn't actually a text file) into a CSV file. No calculations on the data are made (such as converting values to non-metric equivalents, or BMI/BMR/Body Water value calculation). About the only "processing" done on the input is that padding data is removed.

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


out2libra.py
------------

out2libra.py is a small python script that will read the output of mbdy2csv (from stdin) and convert
the values for import into the Libra weight management app for Android. So,

./mbdy2csv BODYDATA.TXT | ./out2libra.py > Libra.csv

will create Libra.csv file suitable for importing into Libra. It currently only works if you have just one user
and have set Libra to use kilograms.


License
-------

GPL V3
