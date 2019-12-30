#!/bin/sh

PWD=$(cd $(dirname $0); pwd)
cd $PWD

print_usage ()
{
  echo "Usage: sh run.sh COMMAND"
  echo "where COMMAND is one of the follows:"
  echo "  Test  测试"
  exit 1
}

if [ $# = 0 ] || [ $1 = "help" ]; then
  print_usage
fi

COMMAND=$1
shift

if [ "$JAVA_HOME" = "" ]; then
  echo "Error: JAVA_HOME is not set."
  exit 1
fi

if [ -d "../XXXXXX" ]; then
    rm -rf ../XXXXXX
fi
