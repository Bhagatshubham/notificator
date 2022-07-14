# notificator
Get a push notification when a command has finished execution

## What

`notif` is a tool that runs the command you supplied and then sends you a push notification
when the command has finished running.<br>
You use `notif` by adding it before the command you want to run.
For example, to be notified when `bitbake core-image-minimal` has finished running:

```bash
notif bitbake core-image-minimal
```

## Why

`notif` was created to minimize the "lost" time between a long-running command finishing
and the moment you realize it did.<br>
I often execute commands that take a long time to run.
While I do not want to continuously monitor the command, I would like to know when it does as soon as possible.
This can be a considerable time-saver since the tool allows you to focus on other activities,
without periodically distracting yourself to check the progress of the command.

## How

`notif` depends on [IFTTT](https://ifttt.com/) and `curl` to send push notifications to your mobile device.

To set the script up, the easiest way is to run the (notif-config.sh) script.
It includes a step-by-step guide on how to:
1. Set up an IFTTT account
2. (https://ifttt.com/create) with a webhook trigger and a notifications action
3. Getting your access key

The configuration script will make all the necessary modifications to `notif` to work with your IFTTT account.
You can run `notif-config.sh` either by downloading it from here, making it executable and running it on your computer
or by executing the following command:

```bash
source <(curl -s https://github.com/Bhagatshubham/notificator/blob/main/notif-config.sh)
```

After running the configuration script, the tool will be downloaded at the current working directory.
Make sure the directory is included in your `PATH` variable.

Alternatively, you may download (notif) directly, make it executable and change the appropriate fields yourself.<br>
Another way to configure `notif` is by setting the appropriate environment variables. Review the (notif)
for further details.

Finally, to receive notifications you will need to install the IFTTT app on your phone
([Android](https://play.google.com/store/apps/details?id=com.ifttt.ifttt),
[iOS](https://apps.apple.com/us/app/ifttt-automation-workflow/id660944635)) and login with your account.
