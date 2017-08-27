
#!/bin/bash

enabled=$(DISPLAY=:0 xset q | grep 'DPMS is' | cut -d ' ' -f 5)
echo Blanking was $enabled
if [ $enabled == "Disabled" ]; then
	DISPLAY=:0 xset s 600 +dpms
	echo but is now Enabled
else
	DISPLAY=:0 xset s 0 -dpms
	echo but is now Disabled
fi

