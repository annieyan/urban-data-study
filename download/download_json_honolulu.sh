path="honolulu"
url="https://data.honolulu.gov"
IDS="ids/honolulu_ids.txt"
mkdir $path

cat $IDS | while read LINE
do
	if [ ! -f $path/$LINE.json ]
	then
		wget -t 1 --output-document=$path/$LINE.json --timeout=10 "$url/api/views/$LINE/rows.json?accessType=DOWNLOAD"
	fi
done

