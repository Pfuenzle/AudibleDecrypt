#!/bin/bash
#./getbit.py "/app/audiobooks/Das Erbe.aax" > /app/audiobooks/bytes.txt
rename  's/.AAX/.aax/' *
#BYTES=$(/app/getbit.py )
#echo $BYTES
cd audiobooks
/app/drmfreeaudible.sh *.aax --m4b --m4bbitrate=128k