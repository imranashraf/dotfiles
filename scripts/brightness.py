#!/usr/bin/python

try:
    # for Python2
    from Tkinter import *   ## notice capitalized T in Tkinter
except ImportError:
    # for Python3
    from tkinter import *   # notice lowercase 't' in tkinter here
import subprocess
import sys
import tkMessageBox

class BrightnessController:
    def __init__(self):
        self.currB = 0.0
        self.window = Tk()
        self.window.title("Brightness Controller")
        self.window.geometry('250x160+450+350') # WxH
        self.window.minsize(240,160) # W,H
        self.window.maxsize(260,180)
        # self.window.iconphoto(self.window, PhotoImage(file="./brightness.pgm") )
        self.canvas = Canvas(self.window) # bg="gray", height=350, width=200
        self.canvas.pack()

        self.scale = Scale( self.canvas, length = 200, tickinterval=25, orient=HORIZONTAL ) # , variable=var
        self.FindCurrentBrightness()
        self.scale.set(self.currB)
        self.scale.pack(anchor=CENTER)

        self.button = Button(self.canvas, text="Update brightness", command=self.UpdateBrightness)
        self.button.pack(anchor=CENTER)

        selection = "Current brightness is " + str(self.currB) + "%"
        self.label = Label(self.canvas, text = selection )
        self.label.pack()

        # if you want to bind Escape key only
        # self.window.bind('<Escape>', self.Close)
        # Following is abit generic to handel multiple key press/release
        self.window.bind_all('<KeyPress>', self.HandelKeyPress)
        # self.window.bind_all('<KeyRelease>', self.HandelKeyRelease)

        menu = Menu(self.window)
        self.window.config(menu=menu)
        helpmenu = Menu(menu)
        menu.add_cascade(label="Help", menu=helpmenu)
        helpmenu.add_command(label="About...", command=self.About)

        #self.monitor=""
        self.monitor = StringVar(self.window)

        self.FindActiveMonitor()
        self.window.mainloop()

    def About(self):
        print("About pressed")
        text =  "Brightness Controller is a simple Python script \n" + \
                "Copyright : I.Ashraf \n" + \
                "This software is free like air"

        tkMessageBox.showinfo("Brightness Controller", text)

    def FindActiveMonitor(self):
        cmd = "xrandr -q | grep ' connected' | cut -d ' ' -f1"
        ret = subprocess.check_output(cmd, shell=True)
        mlist = ret.splitlines()
        jmlist = ', '.join(mlist)
        print("Available monitors : ", mlist)
        if( ret == "" ):
            self.monitor.set = ""
        else:
            self.monitor.set(mlist[0])

        self.monitors = OptionMenu( self.window, self.monitor, *mlist )
        self.monitors.pack()

    def FindCurrentBrightness(self):
        cmd = "xrandr --verbose | grep -i brightness | cut -f2 -d ' '"
        ret = subprocess.check_output( cmd, shell=True)
        if(ret != ""):
            ret = ret.split('\n')[0]
        else:
            ret = ""
        self.currB = int(float(ret) * 100);

    def UpdateBrightness(self):
        newBrightness = float( self.scale.get() ) / 100
        self.currB = newBrightness
        #print( "selected monitor : ", self.monitor.get() )
        cmd = "xrandr --output %s --brightness %.2f" % (self.monitor.get(), newBrightness)
        cmdStatus = subprocess.check_output(cmd, shell=True)
        selection = "Updated brightness to " + str( int(newBrightness*100) ) + "%"
        self.label.config(text = selection)

    def Print(self):
        print("Python based brightness controller")
        print("Active monitor : ", self.monitor.get())
        print("Current brightness level : ", (self.currB * 100), "%")

    def HandelKeyPress(self, event):
        if event.keysym == 'Right':
            # print("Right arrow key pressed")
            self.scale.set( self.scale.get() + 5 )
            self.UpdateBrightness()
        elif event.keysym == 'Left':
            # print("Left arrow key pressed")
            self.scale.set( self.scale.get() - 5 )
            self.UpdateBrightness()
        elif event.keysym == 'Space':
            print("Space key pressed")
        elif event.keysym == 'Escape':
            # print("Escape key pressed")
            self.window.destroy()
            sys.exit()

    # def HandelKeyRelease(self, event):
    #     print("Key Released")

    # def Close(self, event):
    #     # self.window.withdraw() # if you want to only hide it instead of closing
    #                              # and later want to bring it back
    #     sys.exit() # if you want to exit the entire thing

if __name__ == '__main__':
    bc = BrightnessController()
    bc.Print()
