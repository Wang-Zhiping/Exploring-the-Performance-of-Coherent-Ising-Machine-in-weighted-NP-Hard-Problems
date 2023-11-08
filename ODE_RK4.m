function [T,X,dX] = ODE_RK4( Hfun,t,h,x0 )
% [T,X] = ODE_RK4( Hfun,t,h,x0 ) 4������-��������ⳣ΢�ַ���
% HfunΪ����״̬�����ĺ����������ʽΪ dX = Hfun( t,X )
% ���뱣֤����dX�ĸ�ʽΪ������
% tΪʱ��ڵ㣬��Ϊ������ʱ�䷶ΧΪ T = 0:h:t
%             ��2���� ��ʱ�䷶ΧΪ T = t(1):h:t(2)
%             ���� ��ʱ�䷶ΧΪ T = t
% hΪʱ�䲽������t��ǰ��������£��������h����ֵ
% ֱ�Ӹ���ʱ��ڵ�tʱ��h����[]������ֵռλ
% x0Ϊ״̬����ʼֵ  
% �㷨��
%      K1  = Hfun( t(k-1),X(k-1) ) =  dX(k-1)
%      K2 =  Hfun( t(k-1)+h/2,X(k-1)+h*K1/2 )
%      K3 =  Hfun( t(k-1)+h/2,X(k-1)+h*K2/2 )
%      K4 =  Hfun( t(k-1)+h  ,X(k-1)+h*K3 )
%    X(k) =  X(k-1) + (h/6) * (K1 + 2*K2 + 2*K3 +K4)
% By ZFS@wust  2021
% ��ȡ����Matlab/Simulinkԭ�����Ϻͳ������ע΢�Ź��ںţ�Matlab Fans

if nargin < 4
    error('��ʼֵ�������');
end  
if isstr(Hfun)
    eval(['Hfun = @',Hfun,';']);
end

% ȷ��ʱ��ڵ�
n = length(t);
if n == 1
    T = 0:h:t;
elseif n == 2
    T = t(1):h:t(2);
else
    T = t;
end
T = T(:);    % ʱ���Ϊ������

% ����
N = length(T);
x0 = x0(:);  
x0 = x0';                  % ��ֵ��Ϊ������  
m = length(x0);            % ״̬��ά��
X = zeros(N,m);            % ��ʼ��״̬��
dX = zeros(N,m);           % ״̬����
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

     


