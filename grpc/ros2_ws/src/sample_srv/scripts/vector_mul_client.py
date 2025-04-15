#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sample_srv_interfaces.srv import VectorScalar

class VectorMulClient(Node):
    def __init__(self):
        super().__init__('vector_mul_client')
        self.client = self.create_client(VectorScalar, 'vector_mul')
        while not self.client.wait_for_service(timeout_sec=1.0):
            self.get_logger().info('Waiting for the Vector Multiplication Service...')
        self.get_logger().info('Vector Multiplication Service is available.')

    def send_request(self, vector, multiplier):
        request = VectorScalar.Request()
        request.vector.vector = vector
        request.multiplier = multiplier

        self.get_logger().info(f'Sending request with vector: {vector} and multiplier: {multiplier}')
        future = self.client.call_async(request)
        return future

def main(args=None):
    rclpy.init(args=args)
    node = VectorMulClient()

    # Example vector and multiplier
    vector = [1.0, 2.0, 3.0]
    multiplier = 2.0

    future = node.send_request(vector, multiplier)

    # Wait for the result
    rclpy.spin_until_future_complete(node, future)
    if future.result() is not None:
        response = future.result()
        node.get_logger().info(f'Received result: {response.result.vector}')
    else:
        node.get_logger().error('Service call failed.')

    node.destroy_node()
    rclpy.shutdown()

if __name__ == '__main__':
    main()