%Author��Jack Ju
%Function:���ֲ����Ĵ������ٿ�����֤
%HIT
%20200710
clear
%%%%���ֲ����Ĵ�����ѧģ�ͽ���%%%%%%
    %%��������
 L=4;%�������Ӽ�ľ���
 T=0.1;%����ʱ��
 x=2;%��ʼ��λ��x����
 y=1;%��ʼ��λ��y����
 theta=pi/2;%��ʼ��λ��theta����

 x_goal=10;%�յ�λ������
 y_goal=10;%�յ�λ������
 x_push=[x];
 y_push=[y];
 theta_push=[];
 theta_push=[theta];
 k=10;%����
 ki=0.1;%����
 kd=0.1%΢��
 k2=1;
 error_sum=0;
 pre_error=0;
while((x-x_goal)^2+(y-y_goal)^2 >0.01&&(x-x_goal<=0)) 
%%%%%%%%%��һ�����ø�����������һ��ֱ��%%%%%%
  %%%��һ�������pid�����������w
    %%%���㵱ǰ��Ŀ��ĳ������
        theta_goal=atan((y_goal-y)/(x_goal-x));
        theta_error=theta-theta_goal;
        error_sum=error_sum+theta_error;
        w=-k*(theta_error)+ki*error_sum+kd*(theta_error-pre_error);
        pre_error=theta_error;
 
   %%%%�ڶ��������pid�����������v     
        dist=((x-x_goal)^2+(y-y_goal)^2)^(1/2);
        v=k2*dist;
        
 %%%%�������룬�������Ҳ�����
 
 vr=v+w*L/2;%����������Ҫ��ȥ����//4�����������ó��߶�죬������δ���ǵ���
 vl=v-w*L/2;%����������Ҫ��ȥ����
 
 
 
 %%%%process model
 
 %%%�˶�ģ��
 v=(vl+vr)/2;%�����ٶ�
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
 title("�켣ͼ,��ʼ�����pi/2")
 