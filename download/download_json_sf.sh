path="sf"
url="https://data.sfgov.org"
IDS="ids/sf_ids.txt"
mkdir $path

cat $IDS | while read LINE
do
	if [ ! -f $path/$LINE.json ]
	then
		wget -t 1 --output-document=$path/$LINE.json --timeout=10 "$url/api/views/$LINE/rows.json?accessType=DOWNLOAD"
	fi
done

