printf "Starting installation of Karoo apps. \n\n"

printf "Removing spaces from filenames. \n\n"
  
for karoo_file in ./Karoo/apps/*;
do
 echo "removing spaces from apk file:" $karoo_file
 mv "$karoo_file" "${karoo_file// /_}";
done

printf "Installing Karoo apps.....\n\n\n"

for file in ./Karoo/apps/*;
	do 
		./adb install -r $file;
	done

printf "\n\n All Done installing Karoo apps.\n"

./adb push ./Karoo/Android/data/net.osmand.plus /sdcard/Android/data
./adb push ./Karoo/Android/data/de.komoot.android /sdcard/Android/data
./adb push ./Karoo/data/com.teslacoilsw.launcher /sdcard/data

printf "\n\nAll Done installing Osman, Komoot and Nova Launcher data.\n"



