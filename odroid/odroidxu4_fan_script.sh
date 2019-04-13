#!/bin/sh

#script to modify temps points for fan speed

###	 Logic table
# trip point  |    0 |   1 |    2 | 
# temp        |   43 |  55 |   67 | 
# fan speed   |  204 | 225 |  240 |


# set temp variables
TRIP_POINT_0=43000
TRIP_POINT_1=55000
TRIP_POINT_2=67000

echo $TRIP_POINT_0 > /sys/devices/virtual/thermal/thermal_zone0/trip_point_0_temp
echo $TRIP_POINT_0 > /sys/devices/virtual/thermal/thermal_zone1/trip_point_0_temp
echo $TRIP_POINT_0 > /sys/devices/virtual/thermal/thermal_zone2/trip_point_0_temp
echo $TRIP_POINT_0 > /sys/devices/virtual/thermal/thermal_zone3/trip_point_0_temp

echo $TRIP_POINT_1 > /sys/devices/virtual/thermal/thermal_zone0/trip_point_1_temp
echo $TRIP_POINT_1 > /sys/devices/virtual/thermal/thermal_zone1/trip_point_1_temp
echo $TRIP_POINT_1 > /sys/devices/virtual/thermal/thermal_zone2/trip_point_1_temp
echo $TRIP_POINT_1 > /sys/devices/virtual/thermal/thermal_zone3/trip_point_1_temp

echo $TRIP_POINT_2 > /sys/devices/virtual/thermal/thermal_zone0/trip_point_2_temp
echo $TRIP_POINT_2 > /sys/devices/virtual/thermal/thermal_zone1/trip_point_2_temp
echo $TRIP_POINT_2 > /sys/devices/virtual/thermal/thermal_zone2/trip_point_2_temp
echo $TRIP_POINT_2 > /sys/devices/virtual/thermal/thermal_zone3/trip_point_2_temp



#---------------------------------------------------------------------------------------------------------
# other commands
#---------------------------------------------------------------------------------------------------------

# to view temp trip points
# cat /sys/devices/virtual/thermal/thermal_zone{0,1,2,3}/trip_point_{0,1,2}_temp 

# fan speed at trip points
# cat /sys/devices/platform/pwm-fan/hwmon/hwmon0/fan_speed

#---------------------------------------------------------------------------------------------------------
