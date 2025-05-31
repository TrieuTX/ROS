#include <rclcpp/rclcpp.hpp>
#include <std_msgs/msg/string.hpp>

using std::placeholders::_1;

class SimpleSubcriber : public rclcpp::Node
{
public:
    SimpleSubcriber() : Node("simple_subcriber")
    {
        m_sub = create_subscription<std_msgs::msg::String>("chatter", 10, std::bind(&SimpleSubcriber::msgCallback, this, _1));
    }

private:
    rclcpp::Subscription<std_msgs::msg::String>::SharedPtr m_sub;

    void msgCallback(const std_msgs::msg::String &msg) const
    {
        // std_msgs::msg::String _msg = msg;
        RCLCPP_INFO_STREAM(get_logger(), "Subcriper listen msg = " << msg.data.c_str());
    }
};

int main(int argc, char *argv[])
{
    rclcpp::init(argc, argv);
    rclcpp::Node::SharedPtr node = std::make_shared<SimpleSubcriber>();
    rclcpp::spin(node);
    rclcpp::shutdown();

    return 0;
}