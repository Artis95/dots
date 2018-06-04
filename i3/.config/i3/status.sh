!/bin/sh

# Send the header so that i3bar knows we want to use JSON:
echo '{ "version": 1 }'

# Begin the endless array.
echo '['

# We send an empty first array of blocks to make the loop simpler:
echo '[]'

# Now send blocks with information forever:
while :;
do
   echo ",["

      # Status

      # Position will change when monitor size changes,
      # to re position:
      #   - uncomment background
      #   - edit the value or "min_width" untill it is in the centre
      #   - comment background

#      echo '{'
         #echo '"border":"#FF6600",'
         #echo '"border_left":0,'
         #echo '"border_right":0,'
         #echo '"border_top":0,'
#         echo '"min_width": 620,'
#         echo '"align":"center",'
         #echo '"background":"$151515",'
 #        echo "\"full_text\":\"$(~/.i3/scripts/status.sh) \""
#      echo '},'


 ip
      echo '{'
         echo '"border":"#bdc3c7",'
         echo '"border_left":0,'
         echo '"border_right":0,'
         echo '"border_top":0,'
         echo '"background":"#151515",'
         echo "\"full_text\":\"$(~/.i3/scripts/ip.sh)\""
      echo '},'

      # Wifi
      echo '{'
         echo '"border":"#FFCC66",'
         echo '"border_left":0,'
         echo '"border_right":0,'
         echo '"border_top":0,'
         echo '"background":"#151515",'
         echo "\"full_text\":\"$(~/.i3/scripts/network.sh)\""
      echo '},'

# freespace
      echo '{'
         echo '"border":"#1abc9c",'
         echo '"border_left":0,'
         echo '"border_right":0,'
         echo '"border_top":0,'
         echo '"background":"#151515",'
         echo "\"full_text\":\"$(~/.i3/scripts/freespace.sh)\""
      echo '},'

    # battery
      echo '{'
         echo '"border":"#2ecc71",'
         echo '"border_left":0,'
         echo '"border_right":0,'
         echo '"border_top":0,'
         echo '"background":"#151515",'
         echo "\"full_text\":\"$( upower -i /org/freedesktop/UPower/devices/battery_BAT1 | grep percentage | cut -d':' -f2 | xargs)\""
      echo '},'

    # battery 2
      echo '{'
         echo '"border":"#1E824C",'
         echo '"border_left":0,'
         echo '"border_right":0,'
         echo '"border_top":0,'
         echo '"background":"#151515",'
         echo "\"full_text\":\"$( upower -i /org/freedesktop/UPower/devices/battery_BAT0 | grep percentage | cut -d':' -f2 | xargs)\""
      echo '},'

      # Date
      echo "{"
         echo "\"border\":\"#AC75E3\","
         echo "\"border_left\":0,"
         echo "\"border_right\":0,"
         echo "\"border_top\":0,"
         echo '"background":"#151515",'
         echo "\"full_text\":\"$(date +'%d-%m-%Y')\""
      echo '},'


      # Time
      echo "{"
         echo "\"border\":\"#e74c3c\","
         echo "\"border_left\":0,"
         echo "\"border_right\":0,"
         echo "\"border_top\":0,"
         echo '"background":"#151515",'
         echo "\"full_text\":\"$(checkvol)\""
      echo "},"

      # vol

         echo "{"
            echo '"border":"#0066FF",'
            echo '"border_left":0,'
            echo '"border_right":0,'
            echo '"border_top":0,'
            echo '"background":"#151515",'
            echo "\"full_text\":\"$(~/.i3/scripts/time.sh)\""
      echo "}"
   echo "]"
   sleep 10
done
