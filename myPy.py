import asyncio
from adar_api import Adar
from aiocoap import Context

async def main():
    # Create CoAP context
    ctx = await Context.create_client_context()

    # Connect to ADAR sensor
    adar = Adar(ctx, ip_address="10.20.30.40")

    # Get device information
    device_info = await adar.get_device_info()
    print(f"Device: {device_info.device_name}")
    print(f"Firmware: {device_info.firmware_version}")

    # Get single point cloud frame
    point_cloud = await adar.get_point_cloud()
    print(f"Received {len(point_cloud.points)} points")

    # Continuous observation
    async for point_cloud in adar.observe_point_cloud():
        print(f"Received {len(point_cloud.points)} points")
        for point in point_cloud.points:
            print(f"Point: x={point.x:.3f}m, y={point.y:.3f}m, z={point.z:.3f}m, "
                  f"strength={point.strength}, classification={point.classification}")

if __name__ == "__main__":
    asyncio.run(main())