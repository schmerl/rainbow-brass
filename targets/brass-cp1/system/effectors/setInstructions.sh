#!/bin/bash
echo "$1" >> /tmp/ig
. /opt/ros/indigo/setup.bash
. ~/catkin_ws/devel/setup.bash
python ~/catkin_ws/src/ig_action_server/ig_action_client/src/ig_client.py CANCEL
python ~/catkin_ws/src/ig_action_server/ig_action_client/src/ig_client.py /tmp/ig
# Wait for ig_action_server to start the graph
#rostopic echo -n 1 --filter "'Executing the graph' in m.feedback.sequence" /ig_action-server/feedback/sequence
python ~/catkin_ws/src/mars_notifications/src/mars_notification_publisher.py $ "I will arrive at $2" 2>&1 /dev/null
sleep 3
rm -f /tmp/ig 