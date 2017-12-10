import sys

from concurrent import futures
import time
import grpc

class ServerApp:
	def __init__(self):
		self.server = None

	def onCreated(self):
		self.registerAllServer()

	def registerAllServer(self):
		self.server = grpc.server(futures.ThreadPoolExecutor(max_workers=10))

		# helloworld_pb2_grpc.add_GreeterServicer_to_server(Greeter(), server)
		self.server.add_insecure_port('[::]:50051')
		self.server.start()
