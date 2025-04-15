#!/usr/bin/env python3
import rclpy
from rclpy.node import Node
from sample_srv_interfaces.srv import VectorScalar

class VectorMulServer(Node):
    def __init__(self):
        super().__init__('vector_mul_server')
        self.srv = self.create_service(VectorScalar, 'vector_mul', self.vector_mul_callback)
        self.get_logger().info('Vector Multiplication Service is ready.')

    def vector_mul_callback(self, request, response):
        # Perform vector-scalar multiplication
        response.result.vector = [x * request.multiplier for x in request.vector.vector]
        self.get_logger().info(f'Received vector: {request.vector.vector}, multiplier: {request.multiplier}')
        self.get_logger().info(f'Resulting vector: {response.result.vector}')
        return response

def main(args=None):
    rclpy.init(args=args)
    node = VectorMulServer()
    try:
        rclpy.spin(node)
    except KeyboardInterrupt:
        node.get_logger().info('Shutting down Vector Multiplication Service...')
    finally:
        node.destroy_node()
        rclpy.shutdown()

if __name__ == '__main__':
    main()