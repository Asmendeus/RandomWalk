function classic_1D

N = 100000;       %总粒子数
Nstep = 200;      %总步数

X = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(横轴)
x = zeros(1,N);  %每个粒子的位置

%> 固定步数Nstep, 观察最后的粒子分布
% tic;
% r = rand(Nstep,N);
% Y = zeros(1,2*Nstep+1);  %统计最终位置上的粒子数
% for i = 1:N
%     for j = 1:Nstep
%         if(r(j,i) < 0.5)
%             x(i) = x(i)-1;
%         else
%             x(i) = x(i)+1;
%         end
%     end
%     index =  find(X == x(i));
%     Y(index) = Y(index) + 1;
% end
% p = Y/N;
% toc

% plot(X,p);


%> 观察粒子分布随时间(步数)的演化
tic;
r = rand(N,Nstep);
Y = zeros(Nstep,2*Nstep+1);  %统计最终位置上的粒子数
for i = 1:Nstep
    for j = 1:N
        if(r(j,i)<0.5)
            x(j) = x(j)-1;
        else
            x(j) = x(j)+1;
        end
        index = find(X==x(j));
        Y(i,index) = Y(i,index) + 1;
    end
end
p = Y/N;
toc


%> 单个粒子随机游走
tic;
x0 = 0;
r0 = rand(1,Nstep);
site = zeros(Nstep,2*Nstep+1);
for i = 1:Nstep
    if(r0(i)<0.5)
        x0 = x0-1;
    else
        x0 = x0+1;
    end
    index = find(X==x0);
    site(i,index) = 1;
end
toc

save("C:\Users\JAH\Desktop\组\random walk\classic1D\classic1D.mat","p","X","Nstep","site");
fprintf("数据已导出");