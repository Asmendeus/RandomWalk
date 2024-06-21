function quantum_2D

Nstep = 200;      %总步数
X = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(横轴)
Y = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(纵轴)

psi = zeros(4,2*Nstep+1,2*Nstep+1);
% psi(:,Nstep+1,Nstep+1) = 1/2 * [1, -1, 1j, -1j]';  % |ψ>的初态
psi(:,Nstep+1,Nstep+1) = [1 0 0 0]';
c = 1/2 * [ -1 1 1 1; 1 -1 1 1; 1 1 -1 1; 1 1 1 -1]; % quantum coin转移矩阵

%> 固定步数Nstep, 观察最后的粒子分布
% %< 态演化过程
% for i = 1:Nstep
%     temp = pagemtimes(c, psi); % c|ψ>
%     psi(1,:,2:end) = temp(1,:,1:end-1);
%     psi(2,:,1:end-1) = temp(2,:,2:end);
%     psi(3,1:end-1,:) = temp(3,2:end,:);
%     psi(4,2:end,:) = temp(4,1:end-1,:);
% end
% %< 观测粒子分布
% p = zeros(2*Nstep+1,2*Nstep+1);
% for i = 1:2*Nstep+1
%     for k = 1:2*Nstep+1
%         p(i,k) = dot(abs(psi(:,i,k)),abs(psi(:,i,k)));
%     end
% end
% %< 画图
% mesh(X,Y,p)


%> 观察粒子分布随时间(步数)的演化
tic;
p = zeros(Nstep,2*Nstep+1,2*Nstep+1);
for i = 1:Nstep

    temp = pagemtimes(c, psi); % c|ψ>
    psi(1,:,2:end) = temp(1,:,1:end-1);
    psi(2,:,1:end-1) = temp(2,:,2:end);
    psi(3,1:end-1,:) = temp(3,2:end,:);
    psi(4,2:end,:) = temp(4,1:end-1,:);

    for k1 = 1:2*Nstep+1
        for k2 = 1:2*Nstep+1
            p(i,k1,k2) = dot(abs(psi(:,k1,k2)),abs(psi(:,k1,k2)));
        end
    end

end
toc

save("C:\Users\JAH\Desktop\组\random walk\quantum2D\quantum2D.mat","p","X","Y","Nstep");
fprintf("数据已导出");