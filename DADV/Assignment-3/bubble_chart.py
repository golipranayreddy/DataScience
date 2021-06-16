import matplotlib.pyplot as plt
import numpy as np

# creating data
x = np.random.rand( 20 )
y = np.random.rand( 20 )
z = np.random.rand( 20 )
col = np.random.rand( 20 )

# Change global size varying with s
plt.scatter( x, y, s = z * 200, c = col )
plt.savefig( 'bubble_plot.svg', format="svg", dpi=96 )
plt.show()
plt.clf()