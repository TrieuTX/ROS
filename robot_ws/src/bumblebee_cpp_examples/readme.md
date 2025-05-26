colcon build

//execute node
ros2 run bumblebee_cpp_examples simple_publisher

// list topic, chỉ khi node đc execute thì mới có trong msg mới có trong topic list
ros2 topic list

// read data from specific topic
ros2 topic echo /chatter 

chatter is node name


