#include <rclcpp/rclcpp.hpp>
#include <std_msgs/msg/string.hpp>
#include <chrono>

using namespace std::chrono_literals;
class SimplePubliser : public rclcpp::Node
{

public:
    SimplePubliser() : Node("simple_publiser"), m_counter(0)
    {
        // keep maximum 10 messages in queue if sub can't process in time
        m_pub = create_publisher<std_msgs::msg::String>("chatter", 10);
        m_timer = create_wall_timer(1000ms, std::bind(&SimplePubliser::timerCallback, this));
        RCLCPP_INFO(get_logger(), "Publishing at 1 Hz");
    }

private:
    unsigned int m_counter;
    rclcpp::Publisher<std_msgs::msg::String>::SharedPtr m_pub;
    rclcpp::TimerBase::SharedPtr m_timer;

    void timerCallback()
    {
        std_msgs::msg::String msg = std_msgs::msg::String();
        msg.data = "Hello ROS 2 - counter: " + std::to_string(m_counter++);
        m_pub->publish(msg);
    }
};

int main(int argc, char *argv[])
{
    rclcpp::init(argc, argv);
    rclcpp::Node::SharedPtr node = std::make_shared<SimplePubliser>();
    rclcpp::spin(node);
    rclcpp::shutdown();

    return 0;
}