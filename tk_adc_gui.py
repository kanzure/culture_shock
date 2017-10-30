#!/usr/bin/python
# uses pexpect to open a REPL, and then interact with it
# adapted from https://arduino.stackexchange.com/a/17529


from __future__ import print_function, division, absolute_import
import random
import pexpect
import time
import sys
import re
if sys.hexversion > 0x02ffffff:
    import tkinter as tk
else:
    import Tkinter as tk


class App(tk.Frame):
    def __init__(self, parent, title, serial_port):
        tk.Frame.__init__(self, parent)
        self.serial_port = serial_port
        self.npoints = 100
        self.Line1 = [0 for x in range(self.npoints)]
        parent.wm_title(title)
        parent.wm_geometry("800x400")
        self.canvas = tk.Canvas(self, background="white")
        self.canvas.bind("<Configure>", self.on_resize)
        self.canvas.create_line((0, 0, 0, 0), tag='X', fill='darkblue', width=1)
        self.canvas.create_line((0, 0, 0, 0), tag='Y', fill='darkred', width=1)
        self.canvas.create_line((0, 0, 0, 0), tag='Z', fill='darkgreen', width=1)
        self.canvas.grid(sticky="news", columnspan=7)
        self.grid_rowconfigure(0, weight=1)
        self.grid_columnconfigure(0, weight=1)
        self.grid(sticky="news")
        parent.grid_rowconfigure(0, weight=1)
        parent.grid_columnconfigure(0, weight=1)
        
        # change the command from self.serial_read to self.fake to debug/test the GUI/plotting
        b = tk.Button(self, text="pulse", width=10, command=self.read_serial).grid(row=1,column=0)
        
        tk.Label(self, text="Period").grid(row=2, column=0,sticky="e")
        self.p = tk.Entry(self)
        self.p.grid(row=2, column=1,sticky="w")
        self.p.insert(0, '150')

        tk.Label(self, text="Width").grid(row=2, column=2,sticky="w")
        self.w = tk.Entry(self)
        self.w.grid(row=2, column=3,sticky="w")
        self.w.insert(0,'4')

        tk.Label(self, text="Num Pulse Pairs").grid(row=2, column=4)
        self.n_pulses = tk.Entry(self)
        self.n_pulses.grid(row=2, column=5)
        self.n_pulses.insert(0,'92')
        
        
    def fake(self):
        #d = [0, 0, 0, 0, 0, 0, 0, 54.0, 77.0, 135.0, 167.0, 184.0, 235.0, 248.0, 361.0, 246.0, 312.0, 288.0, 292.0, 269.0, 265.0, 295.0, 304.0, 284.0, 277.0, 269.0, 307.0, 306.0, 236.0, 277.0, 269.0, 307.0, 292.0, 280.0, 270.0, 310.0, 307.0, 285.0, 276.0, 270.0, 309.0, 252.0, 280.0, 272.0, 314.0, 306.0, 310.0, 254.0, 176.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0, -1.0]
        d = [int(random.random()*1024) for i in range(self.npoints)]
        for s in d:
            self.append_value(s)
        self.after_idle(self.replot)

    def on_resize(self, event):
        self.replot()

    def read_serial(self):
        """
        Check for input from the serial port. On fetching a line, parse
        the sensor values and append to the stored data and post a replot
        request.
        """
        self.Line1 = [0 for x in range(self.npoints)]

        # open the command passed in from the command-line
        a=pexpect.spawn(self.serial_port)
        
        # log output to the command-line
        a.logfile=sys.stdout
        if self.serial_port.startswith('picocom'):
            a.expect('Terminal ready')
        time.sleep(1)
        a.sendline('\r')
        a.expect('>>>')
        # send CTRL-D to refresh the filesystem
        a.sendcontrol('d')
        a.expect('>>>')

        # call a (adjust) function
        a.sendline('a({},{},{})\r'.format(self.p.get(), self.w.get(), self.n_pulses.get()))
        a.expect('>>>')
        # call pulse function
        a.sendline('pulse()\r')
        a.expect('>>>')
        # print the adc_vals
        a.sendline('adc_vals\r')
        a.expect('>>>')

        # parse the adc_vals list from the terminal
        matches = re.match(r'[^\[]*\[([^\]]+)\]', a.before)
        if matches:
            csv = matches.groups()[0]
            new_list = [s.strip() for s in csv.split(',')]
            #print('before ({})'.format(new_list))
            for s in new_list:
                self.append_value(s)
            self.after_idle(self.replot)
            #print('list is now: {}'.format(self.Line1))

    def append_value(self, x):
        """
        Update the cached data lists with new sensor values.
        """
        self.Line1.append(float(x))
        # remove the first item,
        #self.Line1 = self.Line1[-1 * self.npoints:]
        self.Line1.pop(0)
        return

    def replot(self):
        """
        Update the canvas graph lines from the cached data lists.
        The lines are scaled to match the canvas size as the window may
        be resized by the user.
        """
        w = self.winfo_width()
        h = self.winfo_height()
        max_all = 1024 # 1e-5 # max(self.Line1) + 1e-5
        
        coordsX = []
        for n in range(0, self.npoints):
            x = (w * n) / self.npoints
            coordsX.append(x)
            coordsX.append(h - ((h * (self.Line1[n]+100)) / max_all))
        self.canvas.coords('X', *coordsX)


def main(args = None):
    if args is None:
        args = sys.argv

    if len(args) == 3:
        serial_port = '{} {}'.format(args[1], args[2])
        root = tk.Tk()
        print(serial_port)
        app = App(root, "Culture Shock!", serial_port)
        ##app.fake()  #used for debugging the GUI and plot function, without running the pulser
        app.mainloop()
        return 0
    else:
        print('usage: tk_adc_gui.py <your serial terminal program> /dev/path_to_you_serial_port\nexample: tk_adc_gui.py picocom /dev/ttyACM0')
        return -1

if __name__ == '__main__':
    sys.exit(main())