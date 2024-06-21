from os import X_OK
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import scipy.io as sio
from matplotlib import animation
from matplotlib.animation import FuncAnimation
from matplotlib import colors

data = sio.loadmat(r'C:\Users\JAH\Desktop\组\random walk\classic1D\classic1D.mat')

p = np.array(data["p"])
X = np.array(data["X"])[0]
site = np.array(data["site"])
Nstep = int(data["Nstep"])

fig, ax1 = plt.subplots()


#> 观察粒子分布随时间(步数)的演化

# def update(i):

#     ax1.clear()    #清除上一帧的axes对象
#     ax1.plot(X,p[i],linewidth=0.2)

#     ax1.set_title("1D classic random walk")
#     ax1.set_xlabel('X')
#     ax1.set_ylabel('p')

#     # ax1.set_xlim(-Nstep,Nstep)
#     # ax1.set_ylim(0,1)

#     return ax1


#> 单个粒子随机游走

X0, Y0 = np.meshgrid(X,X)
cMap = colors.ListedColormap(['white','black']) #自定义颜色 黑白色
norm = mpl.colors.Normalize(0,1)

def update(i):

    ax1.clear()    #清除上一帧的axes对象

    Z0 = np.zeros((2*Nstep+1,2*Nstep+1))
    Z0[Nstep] = site[i]
    g = ax1.pcolor(X0, Y0, Z0, norm=norm, cmap=cMap)

    ax1.set_title("1D classic random walk")
    ax1.set_xlabel('X')

    ax1.set_xlim(-Nstep/5,Nstep/5)
    ax1.set_ylim(-Nstep/5,Nstep/5)

    return ax1


anim = FuncAnimation(fig, update, frames=np.arange(0, Nstep), interval=50, blit=False, repeat=False)
# plt.show()
anim.save(r'C:\\Users\\JAH\\Desktop\\组\\random walk\\classic1D\\1D classic single particle.gif')