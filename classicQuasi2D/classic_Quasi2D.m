function classic_Quasi2D

N = 100000;       %总粒子数
Nstep = 200;      %总步数

X = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(横轴)
Y = round(linspace(-Nstep,Nstep,2*Nstep+1));  %粒子所有可能到达的位置(纵轴)
X1 = round(linspace(-Nstep/20,Nstep/20,2*Nstep/20+1));  %画图用坐标范围
Y1 = round(linspace(-Nstep/20,Nstep/20,2*Nstep/20+1));
x = zeros(1,N);  %每个粒子的横坐标
y = zeros(1,N);  %每个粒子的纵坐标

%> 固定步数Nstep, 观察最后的粒子分布
% tic;
% rx = rand(Nstep,N);
% ry = rand(Nstep,N);
% Z = zeros(2*Nstep+1,2*Nstep+1);
% for i = 1:N
%     for j = 1:Nstep
%         if(rx(j,i) < 0.5)
%             x(i) = x(i)-1;
%         else
%             x(i) = x(i)+1;
%         end
%         if(ry(j,i) < 0.5)
%             y(i) = y(i)-1;
%         else
%             y(i) = y(i)+1;
%         end
%     end
%     index_x = find(X==x(i));
%     index_y = find(Y==y(i));
%     Z(index_x,index_y) = Z(index_x,index_y)+1;
% end
% p = Z/N;
% toc

% mesh(X,Y,p)


%> 观察粒子分布随时间(步数)的演化
tic;
rx = rand(N,Nstep);
ry = rand(N,Nstep);
Z = zeros(Nstep,2*Nstep+1,2*Nstep+1);  %统计最终坐标上的粒子数
for i = 1:Nstep
    for j = 1:N
        if(rx(j,i) < 0.5)
            x(j) = x(j)-1;
        else
            x(j) = x(j)+1;
        end
        if(ry(j,i) < 0.5)
            y(j) = y(j)-1;
        else
            y(j) = y(j)+1;
        end
        index_x = find(X==x(j));
        index_y = find(Y==y(j));
        Z(i,index_x,index_y) = Z(i,index_x,index_y) + 1;
    end
end
p = Z/N;
toc


%> 单个粒子随机游走
tic;
x0 = 0;
y0 = 0;
rx0 = rand(1,Nstep);
ry0 = rand(1,Nstep);
site = zeros(Nstep,2*Nstep+1,2*Nstep+1);
for i = 1:Nstep
    if(rx0(i)<0.5)
        x0 = x0-1;
    else
        x0 = x0+1;
    end
    if(ry0(i)<0.5)
        y0 = y0-1;
    else
        y0 = y0+1;
    end
    index_x = find(X==x0);
    index_y = find(Y==y0);
    site(i,index_x,index_y) = 1;
end
toc

save("C:\Users\JAH\Desktop\组\random walk\classicQuasi2D\classicQuasi2D.mat","p","X","Y","X1","Y1","Nstep","site");
fprintf("数据已导出");