#!/usr/bin/env python

import sys
import os
import time
import atexit
from signal import SIGTERM 
from app.app import ServerApp

# python server.py start|stop|restart
_ONE_DAY_IN_SECONDS = 60 * 60 * 24

from vendor.daemon import Daemon

class PontusBuzServer(Daemon):
    def __init__(self, *args, **kwargs):
        super(PontusBuzServer, self).__init__(*args, **kwargs)
        testoutput = open('/var/log/pontus_server/runtime.log', 'w')
        testoutput.write('inited')
        testoutput.close()

    def run(self):
		app = ServerApp()
		app.onCreated()
		try:
		    while True:
		      time.sleep(_ONE_DAY_IN_SECONDS)
		except KeyboardInterrupt:
			pass


def control_daemon(action):
    os.system(" ".join((sys.executable, __file__, action)))


def Usage():
	print "Usage : "
	print "    python server.py start|stop|restart"

def debug():
	d = PontusBuzServer('/var/log/pontus_server/pontus_server.pid', verbose=0)
	d.run()

if __name__ == "__main__":
	
	if len(sys.argv) >= 1 and sys.platform == 'darwin':
		debug()

	if len(sys.argv) >= 2:
		arg = sys.argv[1]
        if arg in ('start', 'stop', 'restart'):
            d = PontusBuzServer('/var/log/pontus_server/pontus_server.pid', 0)
            getattr(d, arg)()
	elif len(sys.argv) == 1:
		debug()
	else:
		Usage()
