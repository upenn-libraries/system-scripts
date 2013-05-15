#!/bin/sh
#
#   Linux chkconfig stuff:
#
#   chkconfig: 345 56 10
#   description: Startup/shutdown script for nexus server
#
#   User name and app name need to change based on the application jetty is deploying.  
#   script assumes you are using the standard distribution of jetty.
#
APP_HOME=/home/nexus/jetty-current
APP_USER="nexus"

# Source function library.
if [ -f "/etc/init.d/functions" ]; then
   . /etc/init.d/functions
fi

start() {
  su - $APP_USER -c "$APP_HOME/bin/jetty.sh start"
}

stop() {
  su - $APP_USER -c "$APP_HOME/bin/jetty.sh stop"
}

restart() {
  stop
  start
}

status() {
  su - $APP_USER -c "$APP_HOME/bin/jetty.sh status"
}

case $1 in
   start)
      start
   ;;
   stop)
      stop
   ;;
   restart)
      restart
   ;;
   status)
      status
   ;;
   *)
   echo "Usage: $NAME {start|stop|restart|status}" >&2
   exit 3
esac
