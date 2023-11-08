% �Ľ���������㷨(Runge-Kutta)���Գ���
% By ZFS@wust  2021
% ��ȡ����Matlab/Simulinkԭ�����Ϻͳ������ע΢�Ź��ںţ�Matlab Fans

clear
clc
close all

%%  ���沽�� h=0.6 ʱ
Hfun = @(t,x) [ x(2)*x(3); -x(1)*x(3); -0.51*x(1)*x(2)];   % һ��΢�ַ��̵������ʽ

% ����
t = [0 12];     % ʱ�䷶Χ
h = 0.6;       % ʱ�䲽��
x0 = [0 1 1];   % ��ʼ״̬

% �Ľ�ŷ�������
[T1,X1] = ODE_ImprovedEuler( Hfun,t,h,x0 );
% �Ľ�ŷ�������
[T2,X2] = ODE_RK4( Hfun,t,h,x0 );
% Matlab�Դ�ode45���
[T3,X3] = ode45( Hfun,t(1):h:t(2),x0 );

% ��ͼ�Ա�
figure
subplot(311)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_1')
legend('�Ľ�ŷ����','�Ľ����������','ode45')
subplot(312)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_2')
legend('�Ľ�ŷ����','�Ľ����������','ode45')
subplot(313)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_3')
legend('�Ľ�ŷ����','�Ľ����������','ode45')


%%  ���沽�� h=0.9 ʱ
% ����
h = 0.9;       % ʱ�䲽��

% �Ľ�ŷ�������
[T1,X1] = ODE_ImprovedEuler( Hfun,t,h,x0 );
% �Ľ�ŷ�������
[T2,X2] = ODE_RK4( Hfun,t,h,x0 );
% Matlab�Դ�ode45���
[T3,X3] = ode45( Hfun,t(1):h:t(2),x0 );

% ��ͼ�Ա�
figure
subplot(311)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_1')
legend('�Ľ�ŷ����','�Ľ����������','ode45')
subplot(312)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_2')
legend('�Ľ�ŷ����','�Ľ����������','ode45')
subplot(313)
plot(T1,X1(:,1),T2,X2(:,1),T3,X3(:,1))
xlabel('Time(s)')
ylabel('x_3')
legend('�Ľ�ŷ����','�Ľ����������','ode45')

