HOST=`hostname`

#Function 1:
# find_file function will read the contents of file from server_list.txt
find_file()
{
	LIST_DIR=$SERVER_HOME/etc/server_list.txt
}

#Main Function
#---------------------------------------------------------------------------------------------------------------
#1: find_file => function has been called and variable LIST_DIR holds the value now
#2: sed '/^\s*$/d' =>  removes all the empty lines and tabs. and new file is created called cleanList
#3: while loop reads one value at a time from cleanList ( pay attention to end of line for done </tmp/cleanList )
#4: if conditions to check if F_HOST and P_HOST has value respectively before do something.
#---------------------------------------------------------------------------------------------------------------
find_file
sed '/^\s*$/d' $LIST_DIR |grep -v "#" > /tmp/cleanList

# reads from cleanList file 
while read cell;
do
    #parse for 3 values
    NAME=`echo $cell |awk -F " " '{print $2}'`
    P_HOST_PORT=`echo $cell |awk -F " " '{print $4}'`
    F_HOST_PORT=`echo $cell |awk -F " " '{print $5}'`

    #parse just hostnames ( remove port numbers )
    P_HOST=`echo $P_HOST_PORT |awk -F "/" '{print $1}'`
    F_HOST=`echo $F_HOST_PORT |awk -F "/" '{print $1}'`

    echo "  name = $NAME and p_host name = $P_HOST_PORT and f_host = $F_HOST_PORT and P_HOST = $P_HOST and F_HOST = $F_HOST"

	#Check for Failure Host 
	if [[ ! -z "${F_HOST// }" ]]; then
    	{

    		if [[ ! -z "${P_HOST// }" ]] ; then
    			{
    				
    				#do certian task
    			}
    		else
    			{
    				#do something else
    			}
    		fi

    	}
	fi
done </tmp/cleanList
#end of whileloop
