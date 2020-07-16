#Drafted by Skylar Houghton 1/31/2020

import os, time, pyautogui, win32gui,win32con, pyscreenshot, pytesseract, cv2, np, datetime, openpyxl, shutil, fnmatch
from PIL import Image
#import tkinter as tk
import matplotlib.pyplot as plt
from tkinter import *
from openpyxl import *

'''
#Launch example image in full screen, forefront fashion
os.startfile('num_image.jpeg')
hwnd = win32gui.GetForegroundWindow()
win32gui.ShowWindow(hwnd, win32con.SW_MAXIMIZE)

#Wait for image to fully load
time.sleep(1)

root = tk.Tk()

#Perform screen capture on x1,y1,x2,y2 dimensions in image
#Needs to take into account monitor resolution size
def resolution():
  root = tk.Tk()
  screen_width = root.winfo_screenwidth()
  screen_height = root.winfo_screenheight()
  if screen_width == 1536 and screen_height == 864:
    im1 = pyscreenshot.grab(bbox=(705, 340, 790, 535 ))
    im2 = pyscreenshot.grab(bbox=(535, 605, 640, 790))    
    #Save snapshots to file
    im1.save('im1.jpg')
    im2.save('im2.jpg')
  elif screen_width == 1920 and screen_height == 1080:
    im1 = pyscreenshot.grab(bbox=(620, 385, 720, 535))
    im2 = pyscreenshot.grab(bbox=(620, 590, 710, 740))   
    #Save snapshots to file
    im1.save('im1.jpg')
    im2.save('im2.jpg')    
  elif screen_width == 2560 and screen_height == 1440:
    im1 = pyscreenshot.grab(bbox=(1085, 568, 1145, 715))
    im2 = pyscreenshot.grab(bbox=(950, 770, 1030, 918))    
    #Save snapshots to file
    im1.save('im1.jpg')
    im2.save('im2.jpg')
  return im1, im2



def printSomething():
    # if you want the button to disappear:
    # button.destroy() or button.pack_forget()
    label = Label(root, text= "Hey whatsup bro, i am doing something very interresting.")
    #this creates a new label to the GUI
    label.pack() 

root = Tk()

button = Button(root, text="Print Me", command=printSomething) 
button.pack()

root.mainloop()




resolution()  
'''
#sanitize image and convert image value(s) to string
# pytesseract.pytesseract.tesseract_cmd = r'C:\Program Files\Tesseract-OCR\tesseract.exe'
# im2_value = cv2.imread('comp_tb.png', cv2.IMREAD_GRAYSCALE)
# im2_value = pytesseract.image_to_string(im2_value, config='--psm 7')


#These were steps gone through for image sanitation. They were distracting the true value of the image, so they are commented out but leaving for reference.
#im2_san = cv2.dilate(im2_value, (5, 5), im2_value)
#im2_san = cv2.resize(im2_value, None, fx=6, fy=6, interpolation=cv2.INTER_CUBIC)
#kernel = np.array([[0, 0, -3],
#                   [-2, 9, -1],
#                   [-1, 0, -1]])
#im2_san = cv2.filter2D(im2_value, -1, kernel)
#cv2.imwrite('comp_tb_san.png', im2_san)
#Used to debug the data type
#print(im2_value)
#print(im2_value[-2:])
#im2_clean = int(im2_value[:-2])
#if im2_value[-2:] == 'GB' or im2_value[-2:] == 'gb':
#  im2_clean = im2_clean * 1024
#print(im2_clean)


#convert data type to singular format
#def conversion():
  #actual number value
#  im2_clean = float(im2_value[:-2])
#  print(im2_clean)
  #delimiter to know if the value is TB or GB or MB, and convert to GB
#  im2_delimit = im2_value[-2:]
#  if im2_delimit == 'MB' or im2_delimit == 'mb':
#    if im2_clean <= 512:
#      im2_clean = float(0.5)
#    elif im2_clean >= 513:
#      im2_clean = float(1.0)
#  if im2_delimit == 'GB' or im2_delimit == 'gb':
#    im2_clean = im2_clean / 1024
#  if im2_delimit == 'TB' or im2_delimit == 'tb':
#    im2_clean = im2_clean
  # return print(im2_clean)
 
# conversion()
 
#----------

#Get and format todays value
d = datetime.datetime.today()
d = d.replace(hour=0, minute=0, second=0, microsecond=0)
print(d)
#Format the current date string
d_format = d.strftime('%m%d%Y') 

#If this statement ends up getting put in a function, need to make checklist_name a global variable
#Preliminarily identfiy files with matching 
for name in glob.glob('C:/Users/Public/Documents/Scripts/Checklist_Automation/*' + d_format + '.xl*'):
  checklist_name = name

#Moves checklist file and marks as duplicate if it matches todays date. Measure to prevent duplicate files  
shutil.move(checklist_name, checklist_name + 'dup')

#Create checklist file  
shutil.copyfile('C:/Users/Public/Documents/Scripts/Checklist_Automation/Platform Checklist Template.xlsx', 'C:/Users/Public/Documents/Scripts/Checklist_Automation/Platform Checklist - ' + d_format + '.xlsx')  
for name in glob.glob('C:/Users/Public/Documents/Scripts/Checklist_Automation/*' + d_format + '.xl*'):
  checklist_name = name

#----------

#Begin recording data in spreadsheets

#Initialize checklist files
# platform_workbook = load_workbook(filename="checklist_name")
#TODO - Need to have a way to automatically create new disk tracking sheet at beginning of the month and initializing weekdays
# disk_workbook = load_workbook(filename="C:/Users/Public/Documents/Scripts/Checklist_Automation/Platform Disk Space Tracking - [MONTH] - [YEAR].xlsx")
# disk_sheet = disk_workbook.active
#disk_sheet["B5"].value


#Get and format Excel cell date value on Disk Tracking Sheet
# excel_date = disk_sheet['A7'].value
# print(excel_date)
# excel_date = excel_date.replace(hour=0, minute=0, second=0, microsecond=0)

##For reference. To format the excel sheet value
#print(excel_date.strftime('%m/%d/%Y'))

#Perform date match on Disk Tracking Sheet
# if d == excel_date:
  # print('The dates do match.')
# else:
  # print('Dates do not match, please verify you are opening the correct worksheet.')
  