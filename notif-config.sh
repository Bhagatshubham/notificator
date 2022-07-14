#!/usr/bin/env bash

# A script to help you set up your notificator

echo "Let's set up notif for you, step-by-step!"
sleep 0.3
echo "1. Create an account of ifttt.com. Press ENTER when you are done."
read
echo "2. Create an applet on https://ifttt.com/create"
sleep 0.3
echo "In the 'If this' section, add 'Webhooks' and select 'Receive a web request'. Press ENTER when you are done."
read
echo "3. In the 'Event Name' section, add 'notif' or whatever event name you would like. Then click on 'Create trigger'."
sleep 0.3
echo -n "When you are done, please type the event name here and press ENTER: "
read EVENT_NAME
echo "4. In the 'Then That' section, add 'Notifications' and select 'Send a notification from the IFTTT app'. Press ENTER when you are done."
read
echo "5. Set up the message you would like to appear in the notification. As '{{value1}}' the command that you run will appear and as '{{value2}}' its result."
sleep 0.3
echo "For example: \"notif: '{{value1}}' finished with result: {{value2}}\""
sleep 0.3
echo "The above will show 'notif: 'ls' finished with result: SUCCESS'."
sleep 0.3
echo "Finally, click on 'Create action', then 'Continue' and 'Finish'. Press ENTER when you are done."
read
echo "6. Find your access key by going to the Webhooks integrations page and clicking on 'Documentation': https://ifttt.com/maker_webhooks"
sleep 0.3
echo "Press ENTER when you are done."
read
echo -n "7. Copy the access key, paste it here and press ENTER: "
read ACCESS_KEY
sleep 0.3
echo "8. Would you like to include the command you ran in the notification? (y/n)"
read INCLUDE_COMMAND_IN_MESSAGE
echo "So far you have provided the following information:"
echo "Event name: $EVENT_NAME"
echo "Access key: $ACCESS_KEY"
echo "Include command in message: $INCLUDE_COMMAND_IN_MESSAGE"
if [ "$INCLUDE_COMMAND_IN_MESSAGE" = "y" ]
then
    INCLUDE_COMMAND_IN_MESSAGE=1
else
    INCLUDE_COMMAND_IN_MESSAGE=0
fi
sleep 0.3
echo "If you are happy with this, press ENTER to continue otherwise re-run this script."
read
echo "Will now download the notif script in the current working directory:" $(pwd)
sleep 0.6
NOTIF_FILE="notif"
curl -o ${NOTIF_FILE} https://github.com/Bhagatshubham/notificator/blob/688ce0dbbf6962c0a7cbe6cb2993377ea3c0b42e/notif
echo "notif. script downloaded. Will now make it executable."
chmod +x ${NOTIF_FILE}
sleep 0.6
echo "notif script made executable. Will configure to use your IFTTT key and event name."
sed -i "s/default_key/$ACCESS_KEY/g" ${NOTIF_FILE}
sed -i "s/default_webhook_event/$EVENT_NAME/g" ${NOTIF_FILE}
sed -i "s/INCLUDE_COMMAND_IN_MESSAGE=1/INCLUDE_COMMAND_IN_MESSAGE=$INCLUDE_COMMAND_IN_MESSAGE/g" ${NOTIF_FILE}
sleep 0.6
echo "notif script configured. I suggest you place it in a \"bin\" directory that is added to your CLI."
sleep 0.6
echo "You can use it by typing 'notif' in your terminal before the command you want to run, e.g. 'notif ls'."
sleep 0.6
echo "Please remember that you have to download the IFTTT app on your mobile device to receive notifications."
echo "To reconfigure the notif, re-run this script or modify it in a text editor."
