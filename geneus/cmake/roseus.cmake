message("[roseus.camke] Loading... PROJECT_NAME=${PROJECT_NAME} USE_ROSBILD=${USE_ROSBUILD}")

# get roseus script file, all genmsg depend on this
if(NOT roseus_INSTALL_DIR)
  set(roshomedir $ENV{ROS_HOME})
  if("" STREQUAL "${roshomedir}")
    set(roshomedir "$ENV{HOME}/.ros")
  endif("" STREQUAL "${roshomedir}")
  set(roseus_INSTALL_DIR ${roshomedir}/roseus/$ENV{ROS_DISTRO})
endif()

if("$ENV{GENEUS_VERBOSE}" STREQUAL "true")
  set(geneus_verbose TRUE)
endif("$ENV{GENEUS_VERBOSE}" STREQUAL "true")

if(NOT COMMAND rosbuild_find_ros_package) ## catkin
  find_package(geneus)
  message("geneus_SOURCE_DIR ${geneus_SOURCE_DIR}")
  if(EXISTS ${geneus_SOURCE_DIR}/cmake/roseus_catkin.cmake)
    include(${geneus_SOURCE_DIR}/cmake/roseus_catkin.cmake)
  elseif(EXISTS ${geneus_SOURCE_PREFIX}/cmake/roseus_catkin.cmake)
    include(${geneus_SOURCE_PREFIX}/cmake/roseus_catkin.cmake)
  else(EXISTS ${geneus_SOURCE_DIR}/cmake/roseus_catkin.cmake)
    include(${geneus_PREFIX}/share/geneus/cmake/roseus_catkin.cmake)
  endif(EXISTS ${geneus_SOURCE_DIR}/cmake/roseus_catkin.cmake)
  return()
endif()
include(roseus_rosbuild.cmake)
