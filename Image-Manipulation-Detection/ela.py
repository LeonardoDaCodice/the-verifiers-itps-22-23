# importing libs
from PIL import ImageChops, Image
import PIL.Image
import os

# feature engineering - Error Level Analysis
def ELA(img_path):
    DIR = "temp/"
    TEMP = "temp.jpg"
    SCALE = 10

    # apre l'immagine
    original = Image.open(img_path)

    # ✅ Se l'immagine ha trasparenza o modalità non RGB, convertila
    if original.mode in ("RGBA", "P", "CMYK"):
        print(f"[INFO] Converting image from {original.mode} to RGB")
        original = original.convert("RGB")

    # crea la directory temporanea se non esiste
    if not os.path.isdir(DIR):
        os.mkdir(DIR)

    # salva una versione JPEG compressa per analisi ELA
    original.save(TEMP, quality=90)
    temporary = Image.open(TEMP)

    # calcola la differenza tra originale e compressa
    diff = ImageChops.difference(original, temporary)
    d = diff.load()

    WIDTH, HEIGHT = diff.size
    for x in range(WIDTH):
        for y in range(HEIGHT):
            d[x, y] = tuple(k * SCALE for k in d[x, y])

    # salva il risultato dell'analisi
    diff.save(os.path.join(DIR, "ela_img.jpg"))
