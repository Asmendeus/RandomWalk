function quantum_Quasi2D

Nstep = 200;      %总步数
X = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(横轴)
Y = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(横轴)

psi_x = zeros(2,2*Nstep+1);
psi_y = zeros(2,2*Nstep+1);
psi_x(:,Nstep+1) = 1/sqrt(2) * [1, 1j]';  % |ψx>的初态
psi_y(:,Nstep+1) = 1/sqrt(2) * [1, 1j]';  % |ψy>的初态

cx = 1/sqrt(2) * [1, 1; 1, -1]; % quantum x_coin转移矩阵
cy = 1/sqrt(2) * [1, 1; 1, -1]; % quantum y_coin转移矩阵

%> 固定步数Nstep, 观察最后的粒子分布
% %< 态演化过程
% for i = 1:Nstep
%     temp_x = cx * psi_x; % cx|ψx>
%     psi_x(1,2:end) = temp_x(1,1:end-1);
%     psi_x(2,1:end-1) = temp_x(2,2:end);
%     temp_y = cy * psi_y; % cx|ψx>
%     psi_y(1,2:end) = temp_y(1,1:end-1);
%     psi_y(2,1:end-1) = temp_y(2,2:end);
% end
% %< 观测粒子分布
% px = zeros(1,2*Nstep+1);
% for i = 1:2*Nstep+1
%     px(i) = dot(abs(psi_x(:,i)),abs(psi_x(:,i)));
% end
% py = zeros(1,2*Nstep+1);
% for i = 1:2*Nstep+1
%     py(i) = dot(abs(psi_y(:,i)),abs(psi_y(:,i)));
% end
% p = px' * py;
% %< 画图
% mesh(X,Y,p)


%> 观察粒子分布随时间(步数)的演化
tic;
px = zeros(1,2*Nstep+1);
py = zeros(1,2*Nstep+1);
p = zeros(Nstep,2*Nstep+1,2*Nstep+1);
for i = 1:Nstep

    temp_x = cx * psi_x; % cx|ψx>
    psi_x(1,2:end) = temp_x(1,1:end-1);
    psi_x(2,1:end-1) = temp_x(2,2:end);
    temp_y = cy * psi_y; % cx|ψx>
    psi_y(1,2:end) = temp_y(1,1:end-1);
    psi_y(2,1:end-1) = temp_y(2,2:end);

    for k = 1:2*Nstep+1
        px(k) = dot(abs(psi_x(:,k)),abs(psi_x(:,k)));
    end
    for k = 1:2*Nstep+1
        py(k) = dot(abs(psi_y(:,k)),abs(psi_y(:,k)));
    end

    p(i,:,:) = px' * py;

end
toc




save("C:\Users\JAH\Desktop\组\random walk\quantumQuasi2D\quantumQuasi2D.mat","p","X","Y","Nstep");
fprintf("数据已导出");