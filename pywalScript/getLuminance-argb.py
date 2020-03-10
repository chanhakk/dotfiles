#!/usr/bin/env python3
import sys
from PIL import Image

imgPath = sys.argv[1]
img = Image.open(imgPath)
img2 = img.resize((1,1))
color = img2.getpixel((0,0))

if isinstance(color,int):
    color = (color, color, color)

#print(color[0])
#print(color[1])
#print(color[2])

luminance = ( 0.299 * color[0] + 0.587 * color[1] + 0.114 * color[2] )/255

if (luminance > 0.5):
    print("FF000000")
else:
    print("FFFFFFFF")
