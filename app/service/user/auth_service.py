from concurrent import futures
import time

import grpc

import auth_pb2
import auth_pb2_grpc

_ONE_DAY_IN_SECONDS = 60 * 60 * 24

class Access(auth_pb2_grpc.AccessServicer):

	def login(self, request, context):
		return auth_pb2.LoginResponse()

	def tokenLogin(self, request, context):
		return auth_pb2.TokenResponse()

	def logout(self, request, context):
		return auth_pb2.LogoutResponse()

	def registerService(self, grpcServer):
		auth_pb2_grpc.add_AccessServicer_to_server(Access(), grpcServer)