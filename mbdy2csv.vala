static int main (string[] args) {
    try {

        // Reference a BMP image file
//        var file = File.new_for_uri ("http://wvnvaxa.wvnet.edu/vmswww/images/test8.bmp");
      var file = File.new_for_path ("BODYDATA.TXT");

        // Open file for reading
        var file_stream = file.read (null);
        var data_stream = new DataInputStream (file_stream);
        //data_stream.set_byte_order (DataStreamByteOrder.LITTLE_ENDIAN);

       
        uint8[] buffer = new uint8[18];
        while(data_stream.read (buffer, 18, null) == 18) {
	    int year = buffer[0] << 8;
            year += buffer[1];
	    
	    int month = buffer[2];
	    int day = buffer[3];
	    int hour = buffer[4];
            int min = buffer[5];
            int sec = buffer[6];

	   var gender = "";
		if ((buffer[7] & 128) == 0) {
			gender = "M";
		} else {
			gender = "F";
		}
	//this is wrong
	   int age = buffer[7];

		   // Step 07: Get height
            int height = buffer[8];

            // Step 08: Get weight
            int tmp1 = buffer[10];
            int tmp2 = buffer[11];
            int weight = tmp1 << 8;
            weight += tmp2;

            // Step 9: Get body fat
            tmp1 = buffer[12];
            tmp2 = buffer[13];
            int fat = tmp1 << 8;
            fat += tmp2;
            
            // Step 10: Get Muscle Mass
            tmp1 = buffer[15];
            tmp2 = buffer[16];
            int mm = tmp1 << 8;
            mm += tmp2;

            // Step 11: Get Visceral Fat
            int vf = buffer[17];
        // Show information
        stdout.printf ("Weight: %ld px\n", weight);
        stdout.printf ("Height: %ld px\n", height);
	stdout.printf(gender); 	
 
	}


    } catch (Error e) {
        stderr.printf ("Error: %s\n", e.message);
        return 1;
    }
    return 0;
	}

