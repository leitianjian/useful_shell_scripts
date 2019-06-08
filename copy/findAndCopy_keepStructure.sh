#!/bin/bash
#
# AUTHOR: Leitianjian
#
# DATE: 2019/06/08
#
# PURPOSE: This scripts is used to find specific extention
#          files($1) and copy them to the target directory($2)
#          with original file structure kept.
# 

SCRIPT_NAME=$(basename $0)
DEST_DIR=$1
SEARCH_EXT=$2
TARGET_DIR=$3

##################################################

function usage
{
  echo "\n*************************************"
  echo "\nUSAGE:    $SCRIPT_NAME [Destination_Dir] [Extend_Name] [Target_Directory]"
  echo "\nEXAMPLE:  $SCRIPT_NAME .md ./temp"
}

#################################################
# Check for the correct number of arguments

if [ $# -ne 3 ]; then
  usage
  exit 1
fi

#################################################
# Check for an valid target directory

if [ ! -d "${DEST_DIR}" ]; then
  echo "\nFirst parameter cannot be a file"
  exit 2
fi

if [ ! -d "${TARGET_DIR}" ]; then
  echo "\nThird parameter cannot be a file"
  exit 2
fi

if [ ! -r "${DEST_DIR}" ] || [ ! -w "${DEST_DIR}" ] || [ ! -x "${DEST_DIR}" ]; then
  echo "Permission denied"
  exit 2
fi

##################################################
# Take action

SEARCH_PARAM="*$SEARCH_EXT"
# find /home/ltj/Documents/computer_org -name \*.md
find $TARGET_DIR -name ${SEARCH_PARAM} -print0 | xargs -0 cp --parents -t ${DEST_DIR} 

