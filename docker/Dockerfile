FROM ros:humble

# Install necessary packages
RUN apt-get update && apt-get install -y \
    python3-colcon-common-extensions \
    vim \
    can-utils \
    && rm -rf /var/lib/apt/lists/*



# Add ROS2 setup to .bashrc
RUN echo "source /opt/ros/humble/setup.bash" >> /root/.bashrc

# Set the working directory
WORKDIR /ros2_ws

# Set the default command
CMD ["bash"]
