from PIL import Image, ImageDraw, ImageFont, UnidentifiedImageError
from datetime import datetime
from glob import glob
import re
import os
import argparse

parser = argparse.ArgumentParser()
parser.add_argument('path', help='Path of the image to timestamp')

image_name_pattern = re.compile('eye\-([0-9]+)\.')
font = ImageFont.truetype("ubuntu.ttf", size=18)

def timestamp_picture(path):
    print(f'Timestamping {path}')
    basename = os.path.basename(path)
    matches = image_name_pattern.findall(basename)
    if len(matches) == 0:
        return

    timestamp = datetime.fromtimestamp(int(matches[0]))
    with Image.open(path) as image:
        draw = ImageDraw.ImageDraw(image)
        draw.text((10, 10), str(timestamp), font=font)
        new_path = str(path).replace('eye-', 'eyets-')
        image.save(new_path, quality=100, subsampling=0)

    print(f'Added {timestamp} to {basename}')

def timestamp_video(directory):
    old_dir = os.getcwd()
    os.chdir(directory)
    try:
        for file in glob('eye-*.jpg'):
            try:
                timestamp_picture(file)
            except UnidentifiedImageError as e:
                print(e)
                pass

    except Exception as e:
        print(e)
        print('Uh oh')
        raise e

    finally:
        os.chdir(old_dir)

args = parser.parse_args()
timestamp_video(args.path)
