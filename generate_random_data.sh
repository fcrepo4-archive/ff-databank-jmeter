#/bin/sh
# A script for generating X files of size X
echo -n "How large should the indivisual files be in KByte? [default: 1024]: "
read FILE_SIZE
if [ ${#FILE_SIZE} = 0 ]; then
	FILE_SIZE=1024
fi
echo -ne "How many files should be generated? [default: 100]: "
read NUM_FILES
if [ ${#NUM_FILES} = 0 ]; then
	NUM_FILES=100
fi
echo -ne "In what subdirectory should the files be put? [default: ./data/] "
read FILE_DIR
if [ ${#FILE_DIR} = 0 ]; then
	FILE_DIR="./data/"
fi

while [ $NUM_FILES -gt 0 ];do
	dd if=/dev/urandom of=${FILE_DIR}/random-${NUM_FILES}.data count=${FILE_SIZE} bs=1024
	let NUM_FILES=NUM_FILES-1
done


