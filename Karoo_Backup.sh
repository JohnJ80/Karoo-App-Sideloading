printf "----------------------------------------------\n"
printf "*                                            *\n"
printf "*      Karoo apps and Nav Backup script      *\n"
printf "*                                            *\n"
printf "----------------------------------------------\n"
printf "\n\n\n"

printf "Backup of apps backed up using ES File Explored installed on Karoo.\n\n"

./adb pull /sdcard/backups/apps ./Karoo

printf "\n\n Backing up of Osmand data and maps.\n\n"

./adb pull /sdcard/Android/data/net.osmand.plus ./Karoo/Android/data

printf "\n\n Backing up fo Komoot Data.\n\n"

./adb pull /sdcard/Android/data/de.komoot.android ./Karoo/Android/data

printf  "\n\nAll done backup up Karoo apps plus Osmand and Komoot data.\n"

