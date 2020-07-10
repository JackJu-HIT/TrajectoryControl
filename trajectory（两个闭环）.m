%Author：Jack Ju
%Function:两轮差速履带车跟踪控制验证
%HIT
%20200710
clear
%%%%两轮差速履带车数学模型建立%%%%%%
    %%参数设置
 L=4;%两个轮子间的距离
 T=0.1;%采样时间
 x=2;%初始化位置x坐标
 y=1;%初始化位置y坐标
 theta=pi/2;%初始化位置theta坐标

 x_goal=10;%终点位置坐标
 y_goal=10;%终点位置坐标
 x_push=[x];
 y_push=[y];
 theta_push=[];
 theta_push=[theta];
 k=10;%比例
 ki=0.1;%积分
 kd=0.1%微分
 k2=1;
 error_sum=0;
 pre_error=0;
while((x-x_goal)^2+(y-y_goal)^2 >0&&(x-x_goal<=0)) 
%%%%%%%%%这一段设置跟踪器，跟踪一段直线%%%%%%
  %%%第一个航向角pid控制器，输出w
    %%%计算当前与目标的朝向误差
        theta_goal=atan((y_goal-y)/(x_goal-x));
        theta_error=theta-theta_goal;
        error_sum=error_sum+theta_error;
        w=-k*(theta_error)+ki*error_sum+kd*(theta_error-pre_error);
        pre_error=theta_error;
 
   %%%%第二个距离的pid控制器，输出v     
        dist=((x-x_goal)^2+(y-y_goal)^2)^(1/2);
        v=k2*dist;
        
 %%%%控制输入，左电机和右侧电机。
 
 vr=v+w*L/2;%控制输入需要你去更改//4代表着你想让车走多快，我这里未考虑到。
 vl=v-w*L/2;%控制输入需要你去更改
 
 
 
 %%%%process model
 
 %%%运动模型
 v=(vl+vr)/2;%中心速度
 w=(vr-vl)/L;
 x=x+v*cos(theta)*T;
 y=y+v*sin(theta)*T;
 theta=theta+w*T;
 x_push=[x_push;x];
 y_push=[y_push;y];
 theta_push=[theta_push;theta];
end
 plot(x_push,y_push,'-+')%,'LineWidth',2)
 xlabel("X")
 ylabel("Y")
 title("轨迹图,初始航向角pi/2")
 
