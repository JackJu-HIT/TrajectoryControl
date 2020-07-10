# TrajectoryControl
用于无人船轨迹跟踪控制
# 一个关于基于Matlab跟踪追踪的验证
# 数学模型基于两轮差速的小车模型
# Trajectory and Control.m文件中代码中主要用PID环节对航向角进行控制，迫使小车走向目标。
# trajectory(两个闭环).m文件中主要用PID环节对航向角和距离进行控制，迫使小车走向目标。(效果很好)
# 我会设置小车起点坐标：
 x=2，y=1,theta=pi/6，终点只是限制x=10，y=10;
 x=2，y=1,theta=pi/2，终点只是限制x=10，y=10;
# 可以得到两个不同轨迹图（只是修改了航向角theta，你也可以修改起点坐标）
  附件参见附件。
# 体的技术说明参见我的CSDN博客，见主页
https://blog.csdn.net/qq_40464599/article/details/107239274   （航向角PID）
https://blog.csdn.net/qq_40464599/article/details/107267774   （航向角PID和距离PID)
