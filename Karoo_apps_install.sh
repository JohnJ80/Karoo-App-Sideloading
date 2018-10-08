for file in ./Karoo/apps/*;
	do 
		./adb install -r $file;
	done

printf "\n\nAll Done installing Karoo apps.\n"

./adb push ./Karoo/Android/data/net.osmand.plus /sdcard/Android/data
./adb push ./Karoo/Android/data/de.komoot.android /sdcard/Android/data

printf "\n\nAll Done installing Osmand and Komoot data.\n"



