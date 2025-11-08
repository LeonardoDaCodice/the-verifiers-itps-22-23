#importing libs

import PIL.Image as pil
from PIL.ExifTags import TAGS


# finding metadata of the image
def findMetadata(img_path):
    
    img = pil.open(img_path)
    flag=0
    try:
        info = img._getexif()
        for (tag,value) in info.items():
            if "Software" == TAGS.get(tag,tag): #checking for software traces
                pass
                flag=1
        if flag==0:
            pass

    except Exception as e:
        pass
