#!/usr/bin/env python3
import numpy as np
import matplotlib.pyplot as plt
import argparse
from scipy.optimize import curve_fit
from scipy.special import lambertw
 
def func(VS, IS, N, RS):
#Define model for diode (see wikipedia article)
    VT = 26e-3
    w = lambertw((IS * RS /(N * VT)) * np.exp((VS + IS * RS) / (N * VT)))
    Current = np.log10((IS * ((w * N * VT / (RS * IS)) - 1) * 1000))
    return Current.real
 
def plot(xdata, ydata, nPoints, IS, N, RS):
#generate a points to plot
    vMin = xdata[0]
    vMax = xdata[len(xdata) - 1],
    vRange = vMax - vMin
    vMin = vMin - 0.1 * vRange
    vMax = vMax + 0.1 * vRange
    vStep = (vMax - vMin) / (nPoints - 1)
    VS = []
    ID = []
    for i in range(0, nPoints):
        voltage = vMin + i * vStep
        current = func(voltage, IS, N, RS)
        VS.append(voltage)
        ID.append(10**current)
 
#Plot the data and model
    plt.figure().canvas.set_window_title('Plot Window') 
    plt.semilogy(xdata, ydata, 'r*', VS, ID, 'b-')
    plt.ylabel('Current / mA')
    plt.xlabel('Voltage / V')
    plt.title('Diode I-V Characteristic')
    plt.show()
 
def main():
#set up parser for command line args
    parser = argparse.ArgumentParser(prog='DiodeModel')
    parser.add_argument('filename', help='Name of file containing I-V data (I in mA, V in volts)')
    parser.add_argument('-c', '--convert', help='Convert read in current to mA', action="store_true")
    parser.add_argument('-p', '--plot', help='Just plot the data and initial guess, no fitting performed', action="store_true")
    parser.add_argument('-IS', '--IS', type=float, default=1e-14, help='Initial guess at saturation current (default = 1e-14 A')
    parser.add_argument('-N', '--N', type=float, default=1, help='Initial guess at Emission coefficient (default = 1)')
    parser.add_argument('-RS', '--RS', type=float, default=10, help='Initial guess at ohmic resistance (default = 10 ohm)')
    parser.add_argument('-m', '--maxit', type=int, default=1000, help='Maximum number of iterations (default = 1000)')
    parser.add_argument('-n', '--npoints', type=int, default=250, help='Number of points in plot (default = 250)')
    parser.add_argument('-s', '--save', help='Save fit parameters to file', action="store_true")
    parser.add_argument('-f', '--fitfile', type=str, default="", nargs='?', help='Load fit parameters from specified file')
    args = parser.parse_args()
     
#Read in data from file (V in volt, I in milliamp)
    xdata, ydata = np.loadtxt(args.filename, unpack=True)
    if args.convert:           #Data is in A convert to mA
        ydata = ydata * 1000
    logydata = np.log10(ydata) #log of current to produce stable fit
 
#Set up initial guess
    params = dict(IS = args.IS, N = args.N, RS = args.RS)
 
#Check if input file is given
    if args.fitfile is None:                              #Use default filename
        fitFile = args.filename.split('.')[0] + ".fit"
        try:
            fh = open(fitFile, 'r')
            for line in fh:
                name = line.split('=')[0].strip()
                value = float(line.split('=')[1].strip())
                params[name] = value
            fh.close()
        except IOError as e:
            print("I/O error({0}): {1}".format(e.errno, e.strerror))
    elif len(args.fitfile) > 0:                           #Use input filename
        fitFile = args.fitfile
        try:
            fh = open(fitFile, 'r')
            for line in fh:
                name = line.split('=')[0].strip()
                value = float(line.split('=')[1].strip())
                params[name] = value
            fh.close()
        except IOError as e:
            print("I/O error({0}): {1}".format(e.errno, e.strerror))
     
    if args.plot:
        try:
#Plot data and initial guess
            print("Plotting characteristic with following parameters" +
                "\nIS = " + str(params['IS']) + "\nN = " + str(params['N']) + "\nRS = " + str(params['RS']))
            plot(xdata, ydata, args.npoints, params['IS'], params['N'], params['RS'])
        except:
            print("Plotting error")
            exit()
    else:
#Perform non-linear least squares fit
        try:
            popt, pcov, infodict, errmsg, ier = curve_fit(
                func, xdata, logydata, p0=(params['IS'], params['N'], params['RS']), maxfev = args.maxit, full_output = True)
             
#Print converged fit parameters
            print("Fit converged in " + str(infodict['nfev']) + " iterations with the following parameters")
            printString = "IS = " + str(popt[0]) + "\nN = " + str(popt[1]) + "\nRS = " + str(popt[2])
            print(printString)
 
#Output parameters to file
            if args.save:
                print("\nWriting fit parameters to file")
                outFile = args.filename.split('.')[0] + ".fit"
                try:
                    fh = open(outFile,"w")
                    fh.write(printString)
                    fh.close()
                except IOError as e:
                    print("I/O error({0}): {1}".format(e.errno, e.strerror))
 
#generate a plot of the fit
            plot(xdata, ydata, args.npoints, popt[0], popt[1], popt[2])
 
        except RuntimeError as e:
            print("Error – Fit did not converge, try adjusting the starting guess")
            print(e)
 
if __name__ == "__main__":
    main()

