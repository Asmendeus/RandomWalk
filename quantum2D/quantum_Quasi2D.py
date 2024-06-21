from os import X_OK
import numpy as np
import matplotlib.pyplot as plt
import matplotlib as mpl
import scipy.io as sio
from matplotlib import animation
from matplotlib.animation import FuncAnimation
from matplotlib import colors
from mpl_toolkits.mplot3d import Axes3D

data = sio.loadmat(r'C:\Users\JAH\Desktop\组\random walk\quantum2D\quantum2D.mat')

p = np.array(data["p"])
Nstep = int(data["Nstep"])
X = np.array(data["X"])[0]
Y = np.array(data["Y"])[0]
X,Y = np.meshgrid(X,Y)


#> 观察粒子分布随时间(步数)的演化

fig, ax1 = plt.subplots(figsize=(16,9),subplot_kw={'projection':'3d'})

def update(i):

    ax1.clear()    #清除上一帧的axes对象

    g = ax1.plot_wireframe(X,Y,p[i],rstride=1,cstride=1,linewidth=0.2,color="b")

    ax1.set_title("2D quantum random walk")
    ax1.set_xlabel('X')
    ax1.set_ylabel('Y')
    ax1.set_zlabel('p')

    # ax1.set_zlim(0,1)

    return ax1


anim = FuncAnimation(fig, update, frames=np.arange(0, Nstep), interval=50, blit=False, repeat=False)
# plt.show()
anim.save(r'C:\\Users\\JAH\\Desktop\\组\\random walk\\quantum2D\\2D quantum probability distribution_nolim.gif')