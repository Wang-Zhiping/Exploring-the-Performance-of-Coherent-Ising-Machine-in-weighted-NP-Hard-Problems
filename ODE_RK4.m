function [T,X,dX] = ODE_RK4( Hfun,t,h,x0 )
% [T,X] = ODE_RK4( Hfun,t,h,x0 ) 4阶龙格-库塔法求解常微分方程
% Hfun为描述状态导数的函数句柄，格式为 dX = Hfun( t,X )
% 必须保证返回dX的格式为行向量
% t为时间节点，可为标量，时间范围为 T = 0:h:t
%             长2向量 ，时间范围为 T = t(1):h:t(2)
%             向量 ，时间范围为 T = t
% h为时间步长，在t的前两种情况下，必须给出h具体值
% 直接给出时间节点t时，h可用[]或任意值占位
% x0为状态量初始值  
% 算法：
%      K1  = Hfun( t(k-1),X(k-1) ) =  dX(k-1)
%      K2 =  Hfun( t(k-1)+h/2,X(k-1)+h*K1/2 )
%      K3 =  Hfun( t(k-1)+h/2,X(k-1)+h*K2/2 )
%      K4 =  Hfun( t(k-1)+h  ,X(k-1)+h*K3 )
%    X(k) =  X(k-1) + (h/6) * (K1 + 2*K2 + 2*K3 +K4)
% By ZFS@wust  2021
% 获取更多Matlab/Simulink原创资料和程序，清关注微信公众号：Matlab Fans

if nargin < 4
    error('初始值必须给出');
end  
if isstr(Hfun)
    eval(['Hfun = @',Hfun,';']);
end

% 确定时间节点
n = length(t);
if n == 1
    T = 0:h:t;
elseif n == 2
    T = t(1):h:t(2);
else
    T = t;
end
T = T(:);    % 时间变为列向量

% 计算
N = length(T);
x0 = x0(:);  
x0 = x0';                  % 初值变为行向量  
m = length(x0);            % 状态量维数
X = zeros(N,m);            % 初始化状态量
dX = zeros(N,m);           % 状态导数
X(1,:) = x0;
for k = 2:N
    h = T(k) - T(k-1);
    K1 = Hfun( T(k-1)     , X(k-1,:)' );    
    K2 = Hfun( T(k-1)+h/2 , X(k-1,:)'+h*K1/2 ); 
    K3 = Hfun( T(k-1)+h/2 , X(k-1,:)'+h*K2/2 ); 
    K4 = Hfun( T(k-1)+h   , X(k-1,:)'+h*K3 ); 
    X(k,:) = X(k-1,:)' + (h/6) * ( K1 + 2*K2 + 2*K3 + K4 );      
    dX(k-1,:) = (1/6) * ( K1 + 2*K2 + 2*K3 + K4 );
end
dX(N,:) = Hfun( T(N),X(N,:) );

if nargout == 0
    plot(T,X)
end

     


