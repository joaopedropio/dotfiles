#!/bin/bash

COMMAND=$1
VALUE=$2

SCREEN=eDP-1

BACKLIGHT_DIR=~/.config/i3/backlight
BACKLIGHT_VALUE_FILE=$BACKLIGHT_DIR/backlight_value
BACKLIGHT_VALUE=$(cat $BACKLIGHT_VALUE_FILE) 

if [ $COMMAND == "set" ];
then
    xrandr --output $SCREEN --brightness $VALUE
    exit 0
fi 

if [ $COMMAND == "inc" ];
then
    NEW_VALUE=$(echo "$BACKLIGHT_VALUE + $VALUE" | bc)

    echo "new value =>" $NEW_VALUE
    DECIMAL_VALUE=$(echo $(printf "%.0f" $(echo "$NEW_VALUE * 100" | bc))) 
    echo "decimal value " $DECIMAL_VALUE

    if [ $DECIMAL_VALUE -le 100 ]
    then
        xrandr --output $SCREEN --brightness $NEW_VALUE
        echo $NEW_VALUE > $BACKLIGHT_VALUE_FILE
        exit 0
    else
        echo "Can't set brightness level to $NEW_VALUE!"
        exit 1
    fi
fi 



if [ $COMMAND == "dec" ];
then
    NEW_VALUE=$(echo "$BACKLIGHT_VALUE - $VALUE" | bc)

    echo "new value =>" $NEW_VALUE
    DECIMAL_VALUE=$(echo $(printf "%.0f" $(echo "$NEW_VALUE * 100" | bc))) 
    echo "decimal value " $DECIMAL_VALUE

    if [ $DECIMAL_VALUE -gt 1 ]
    then
        xrandr --output $SCREEN --brightness $NEW_VALUE
        echo $NEW_VALUE > $BACKLIGHT_VALUE_FILE
        exit 0
    else
        echo "Can't set brightness level to $NEW_VALUE!"
        exit 1
    fi
fi 



echo $BACKLIGHT_DIR
echo $BACKLIGHT_VALUE
echo $COMMAND
