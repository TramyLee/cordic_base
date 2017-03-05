#-*-coding:utf-8 -*-
#!/usr/bin/env python
import sys
import math
import pylab as plt
def cordic(deg,times=8,width=16):
 	width_value=2**width
 	quadrant=deg>>(width-2)
 	x=int(0.60725*width_value/2)
 	y=0
 	z=deg%(2**(width-2))
 	for i in range(times):
 		if z>=0:
 			x_new=x-int(y>>i)
 			y_new=y+int(x>>i)
 			z=z-int(width_value*math.atan(1.0/(1<<i))/(math.pi*2))
		else:
			x_new=x+int(y>>i)
 			y_new=y-int(x>>i)
 			z=z+int(width_value*math.atan(1.0/(1<<i))/(math.pi*2))
		x=x_new
		y=y_new
 	if quadrant==0:
 		cordic_cos=x
 		cordic_sin=y
	elif quadrant==1:
		cordic_cos=-y
 		cordic_sin=x
 	elif quadrant==2:
 		cordic_cos=-x
 		cordic_sin=-y
	else:
		cordic_cos=y
 		cordic_sin=-x
	return cordic_cos,cordic_sin

def err_table(cordic_sin,std_sin):
	N=24
	print "+"+ "-"*29+"+"
	for i in range(N):
		a=360*i/N
		x=cordic_sin[len(cordic_sin)*i/N]
		y=std_sin[len(std_sin)*i/N]
		if math.fabs(y)<=0.1:
			err="  -  "
		else:
			err=100.0*math.fabs(float(x-y)/y)
			err="%3.2f" %err
		print "|%5d|%8d|%8d|%5s|" %(a,x,int(y),err)
		print "+"+ "-"*29+"+"


			

def main():
	x=[i for i in range(2**16)]
	cordic_sin=[cordic(i)[1] for i in x]
	std_sin=[2**15*math.sin(math.pi*i/(2**15)) for i in x]
	line1,=plt.plot(x,cordic_sin,'r-',label='cordic_sin')
	line2,=plt.plot(x,std_sin,'g--',label='sin')
	err_table(cordic_sin,std_sin)
	plt.legend(handles=[line1,line2])
	plt.xlabel('x')
	plt.ylabel('y')
	plt.title('cordic_sin and $2^{15}$sin($\pi$x/$2^{15}$)')
	plt.show()

if __name__ == '__main__':
	main()