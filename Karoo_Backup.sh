
SECONDS=0

printf "*____________________________________________*\n"
printf "*                                            *\n"
printf "*      Karoo apps and Nav Backup script      *\n"
printf "*                                            *\n"
printf "*____________________________________________*\n"
printf "\n\n\n"

printf "Setting up directory for backup.\n"

if [mkdir ./Karoo/apps_backup]
	then
	printf "Created backup directory with no issues. \n"
else
	printf "Using backup directory to backup current apps backup.\n"
fi

printf "Copying previous backup to backup directory.\n"

rm -r ./Karoo/apps_backup
cp -R -v ./Karoo/apps ./Karoo/apps_backup

printf "Backup of apps backed up using ES File Explored installed on Karoo.\n\n"

rm -r ./Karoo/apps
mkdir ./Karoo/apps

./adb pull /sdcard/backups/apps ./Karoo

printf "\n\n Backing up of Osmand data and maps.\n\n"

./adb pull -a /sdcard/Android/data/net.osmand.plus ./Karoo/Android/data

printf "Backing up of Komoot Data."

./adb pull -a /sdcard/Android/data/de.komoot.android ./Karoo/Android/data

printf "\n\nBacking up Nova Launcher data including backups.\n\n"

./adb pull -a /sdcard/data/com.teslacoilsw.launcher ./Karoo/data/

printf  "\n\nAll done backup up Karoo apps plus Osmand and Komoot data.\n"

printf "Renaming backed up apps without spaces in their names for easy re-install.\n"

printf "Starting Rename_files.sh \n"

for karoo_file in ./Karoo/apps/*;
do
 echo "removing spaces from apk file:" $karoo_file
 mv "$karoo_file" "${karoo_file// /_}";
done

printf "\nList of backed up apps.\n\n"

ls ./Karoo/apps

printf "\nList of backep up Osmand maps.\n"

ls -al ./Karoo/Android/data/net.osmand.plus/files/*.obf

printf "\n List of other files backed up.\n"
ls -al ./Karoo/data

printf "\n\n\n --------All Done!---------\n\n\n"
duration=$SECONDS
duration=$SECONDS
echo " $(($duration / 60)) minutes and $(($duration % 60)) seconds elapsed."
printf "\n\n"
