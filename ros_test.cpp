#include "ros/ros.h"
#include <std_msgs/Float32.h>

#include <sstream>
#include <concepts>

int main(int argc, char **argv)
{
  ros::init(argc, argv, "talker");

  ros::NodeHandle n;

  ros::Publisher chatter_pub = n.advertise<std_msgs::Float32>("chatter", 1000);

  ros::Rate loop_rate(10);

  while (ros::ok())
  {
    static float f = 0;

    std_msgs::Float32 msg = { .data = f++ };
    //msg.data = f++;

    ROS_INFO("%f\n", msg.data);

    chatter_pub.publish(msg);

    ros::spinOnce();

    loop_rate.sleep();
  }


  return 0;
}
