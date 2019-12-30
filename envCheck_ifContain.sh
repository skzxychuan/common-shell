#!/bin/sh

HOSTNAME=`hostname`
DEV_DEPLOY_LOG_DIR=/tmp/XXXXXX

if [[ ! ${HOSTNAME} =~ "rocket" ]]; then
    if [ ! -d "${DEV_DEPLOY_LOG_DIR}" ]; then
        mkdir -p ${DEV_DEPLOY_LOG_DIR}
    fi
    nohup sh run.sh JarLauncher > ${DEV_DEPLOY_LOG_DIR}/XXXXXX.log &
else
    nohup sh run.sh JarLauncher &
fi
