from os import X_OK
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import scipy.io as sio
from matplotlib import animation
from matplotlib.animation import FuncAnimation
from matplotlib import colors
from mpl_toolkits.mplot3d import Axes3D

data = sio.loadmat(r'C:\Users\JAH\Desktop\组\random walk\quantum1D\quantum1D.mat')

p = np.array(data["p"])
Nstep = int(data["Nstep"])
X = np.array(data["X"])[0]

fig, ax1 = plt.subplots()

#> 观察粒子分布随时间(步数)的演化

def update(i):

    ax1.clear()    #清除上一帧的axes对象
    ax1.plot(X,p[i],linewidth=0.2)

    ax1.set_title("1D quantum random walk")
    ax1.set_xlabel('X')
    ax1.set_ylabel('p')

    # ax1.set_xlim(-Nstep,Nstep)
    ax1.set_ylim(0,1)

    return ax1


anim = FuncAnimation(fig, update, frames=np.arange(0, Nstep), interval=50, blit=False, repeat=False)
# plt.show()
anim.save(r'C:\\Users\\JAH\\Desktop\\组\\random walk\\quantum1D\\1D quantum probability distribution.gif')