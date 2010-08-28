static int main (string[] args) {
    try {
	var file = File.new_for_path (args[1]);

        // Open file for reading
        var file_stream = file.read (null);
        var data_stream = new DataInputStream (file_stream);
        //data_stream.set_byte_order (DataStreamByteOrder.LITTLE_ENDIAN);

       	int pcount = 1;
	int slotcount = 1;
        uint8[] buffer = new uint8[18];
	while(data_stream.read (buffer, 18, null) == 18) {
		if (! isBufferEmpty(buffer)) {
			stdout.printf("%ld,", pcount);
			printBuffer(buffer);
		} 

		slotcount += 1;
		if (slotcount > 35) {
			slotcount = 1;
			pcount +=1;
		}
 
	}


    } catch (Error e) {
        stderr.printf ("Error: %s\n", e.message);
        return 1;
    }
    return 0;
}

private static bool isBufferEmpty(uint8[] buffer) {
	return  buffer[0] == 0 && buffer[1] == 0 && buffer[2] == 0 && buffer[3] == 0; 
}

private static void printBuffer(uint8[] buffer) {
    int year = buffer[0] << 8;
    year += buffer[1];

    int month = buffer[2];
    int day = buffer[3];
    int hour = buffer[4];
    int min = buffer[5];
    int sec = buffer[6];

    var gender = "";
    if ((buffer[7] & 128) == 0) {
        gender = "F";
    } else {
        gender = "M";
    }

    int age = buffer[7] & ~128;
    int height = buffer[8];

    int tmp1 = buffer[10];
    int tmp2 = buffer[11];
    int weight = tmp1 << 8;
    weight += tmp2;

    tmp1 = buffer[12];
    tmp2 = buffer[13];
    int fat = tmp1 << 8;
    fat += tmp2;
            
    tmp1 = buffer[15];
    tmp2 = buffer[16];
    int mm = tmp1 << 8;
    mm += tmp2;

    int vf = buffer[17];
		
    stdout.printf("%ld,%ld,%ld,%ld,%ld,%ld,%s,%ld,%ld,%ld,%ld,%ld,%ld\n", year, month, day, hour, min, sec, gender, age, height, weight, fat, mm, vf);

}
