% 四阶龙格库塔算法(Runge-Kutta)测试程序
% By ZFS@wust  2021
% 获取更多Matlab/Simulink原创资料和程序，清关注微信公众号：Matlab Fans

clear
clc
close all

%%  仿真步长 h=0.6 时
Hfun = @(t,x) [ x(2)*x(3); -x(1)*x(3); -0.51*x(1)*x(2)];   % 一阶微分方程导数表达式

% 参数
t = [0 12];     % 时间范围
h = 0.6;       % 时间步长
x0 = [0 1 1];   % 初始状态

% 改进欧拉法求解
[T1,X1] = ODE_ImprovedEuler( Hfun,t,h,x0 );
% 改进欧拉法求解
[T2,X2] = ODE_RK4( Hfun,t,h,x0 );
% Matlab自带ode45求解
[T3,X3] = ode45( Hfun,t(1):h:t(2),x0 );

% 绘图对比
figure
subplot(311)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_1')
legend('改进欧拉法','四阶龙格库塔法','ode45')
subplot(312)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_2')
legend('改进欧拉法','四阶龙格库塔法','ode45')
subplot(313)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_3')
legend('改进欧拉法','四阶龙格库塔法','ode45')


%%  仿真步长 h=0.9 时
% 参数
h = 0.9;       % 时间步长

% 改进欧拉法求解
[T1,X1] = ODE_ImprovedEuler( Hfun,t,h,x0 );
% 改进欧拉法求解
[T2,X2] = ODE_RK4( Hfun,t,h,x0 );
% Matlab自带ode45求解
[T3,X3] = ode45( Hfun,t(1):h:t(2),x0 );

% 绘图对比
figure
subplot(311)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_1')
legend('改进欧拉法','四阶龙格库塔法','ode45')
subplot(312)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_2')
legend('改进欧拉法','四阶龙格库塔法','ode45')
subplot(313)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_3')
legend('改进欧拉法','四阶龙格库塔法','ode45')

