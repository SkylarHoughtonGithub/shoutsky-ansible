import os, time, pyautogui, win32gui,win32con, pyscreenshot, pytesseract, cv2, np, datetime, openpyxl, shutil, fnmatch, glob
from PIL import Image
import matplotlib.pyplot as plt
from tkinter import *
from openpyxl import *

#Prepare Platform checklist file

#TODO: If this statement ends up getting put in a function, need to make checklist_name a global variable
#TODO: Also when not a test script, need to dynamically change working directory before finding file
#Preliminarily identfiy files with matching 
#for name in glob.glob('C:/Users/Public/Documents/Scripts/Checklist_Automation/*' + d_format + '.xl*'):
  #checklist_name = name

#Moves checklist file and marks as duplicate if it matches todays date. Measure to prevent duplicate files  
#shutil.move(checklist_name, checklist_name + 'dup')

#Create checklist file  
#shutil.copyfile('C:/Users/Public/Documents/Scripts/Checklist_Automation/Platform Checklist Template.xlsx', 'C:/Users/Public/Documents/Scripts/Checklist_Automation/Platform Checklist - ' + d_format + '.xlsx')  
#for name in glob.glob('C:/Users/Public/Documents/Scripts/Checklist_Automation/*' + d_format + '.xl*'):
  #checklist_name = name

##TODO: Make GUI that can control the checklist process.
# def printSomething():
    ##if you want the button to disappear:
    ##button.destroy() or button.pack_forget()
    # label = Label(root, text= "Hey whatsup bro, i am doing something very interresting.")
    ##this creates a new label to the GUI
    # label.pack() 

# root = Tk()

# button = Button(root, text="Print Me", command=printSomething) 
# button.pack()

# root.mainloop()