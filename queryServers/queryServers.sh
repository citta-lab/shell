#
#!/bin/bash
# Set up files
data=data.txt
my_sort=data_sorted.txt

#STEP 1:
# Clean up the files if they have previous data
if [ -f $data ]
then
    rm -f $data
else echo "Starting a clean Data File"
fi

if [ -f $my_sort ]
then
    rm -f $my_sort
else echo "Removing the old Sorted File"
fi

#STEP 2:
for i in `cat server_list`
do echo "Cell $i "
    #query or anything we need to perform goes here
echo "$i = $mq"  >> $data
done

cat $data | sort -k 3,3 -V >> $my_sort
#writing the findings to data and sorted data to sorted_data files
