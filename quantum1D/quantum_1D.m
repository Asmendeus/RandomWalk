function quantum_1D

Nstep = 200;      %总步数
X = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(横轴)

psi = zeros(2,2*Nstep+1);
psi(:,Nstep+1) = 1/sqrt(2) * [1, 1j]';  % |ψ>的初态
c = 1/sqrt(2) * [1, 1; 1, -1]; % quantum coin转移矩阵

%> 固定步数Nstep, 观察最后的粒子分布
% %< 态演化过程
% for i = 1:Nstep
%     temp = c * psi; % c|ψ>
%     psi(1,:) = [0 temp(1,1:end-1)];
%     psi(2,:) = [temp(2,2:end) 0];
% end
% %< 观测粒子分布
% p = zeros(1,2*Nstep+1);
% for i = 1:2*Nstep+1
%     p(i) = dot(abs(psi(:,i)),abs(psi(:,i)));
% end
% %< 画图
% plot(X,p);


%> 观察粒子分布随时间(步数)的演化
tic;
p = zeros(Nstep,2*Nstep+1);
for i = 1:Nstep

    temp = c * psi; % c|ψ>
    psi(1,:) = [0 temp(1,1:end-1)];
    psi(2,:) = [temp(2,2:end) 0];
    % psi(1,2:end) = temp(1,1:end-1);
    % psi(2,1:end-1) = temp(2,2:end);

    for k = 1:2*Nstep+1
        p(i,k) = dot(abs(psi(:,k)),abs(psi(:,k)));
    end

end
toc




save("C:\Users\JAH\Desktop\组\random walk\quantum1D\quantum1D.mat","p","X","Nstep");
fprintf("数据已导出");