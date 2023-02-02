FROM osrf/ros:noetic-desktop-full

# nvidia-container-runtime
ENV NVIDIA_VISIBLE_DEVICES \
    ${NVIDIA_VISIBLE_DEVICES:-all}
ENV NVIDIA_DRIVER_CAPABILITIES \
    ${NVIDIA_DRIVER_CAPABILITIES:+$NVIDIA_DRIVER_CAPABILITIES,}graphics

ADD ./ /uuv_simulator/src

RUN /bin/bash -c "source /opt/ros/noetic/setup.bash && cd /uuv_simulator && catkin_make"

ENTRYPOINT ["/uuv_simulator/entrypoint.sh"]
