import os
import sys
import numpy as np
import argparse
from PIL import Image
import torch

import level1, ela
from model import IMDModel


def infer(img_path, model, device):
    # Analisi livello 1: metadati
    level1.findMetadata(img_path=img_path)

    # Analisi livello 2: ELA
    ela.ELA(img_path=img_path)

    # Carica e prepara l'immagine ELA per la rete neurale
    img = Image.open(os.path.join(os.path.dirname(__file__), "..", "temp", "ela_img.jpg"))
    img = img.resize((128, 128))
    img = np.array(img, dtype=np.float32).transpose(2, 0, 1) / 255.0
    img = np.expand_dims(img, axis=0)

    # Inference
    out = model(torch.from_numpy(img).to(device=device))
    y_pred = torch.max(out, dim=1)[1]

    print("Prediction:", end=' ')
    print("Authentic" if y_pred else "Tampared")  # auth -> 1 and tp -> 0


if __name__ == "__main__":
    parser = argparse.ArgumentParser(description='Image Manipulation Detection')

    req_args = parser.add_argument_group('Required Args')
    req_args.add_argument('-p', '--path', type=str, metavar='img_path', dest='img_path', required=True,
                          help='Image Path')

    args = parser.parse_args()

    # Selezione del dispositivo (CPU o GPU)
    device = torch.device('cuda' if torch.cuda.is_available() else 'cpu')

    # Percorso assoluto del modello
    base_dir = os.path.dirname(os.path.abspath(__file__))
    model_path = os.path.join(base_dir, "model", "model_c1.pth")

    # Controllo che il modello esista
    if not os.path.exists(model_path):
        print(f"[ERRORE] Modello non trovato: {model_path}")
        sys.exit(1)

    # Carica il modello
    model = torch.load(model_path, map_location=torch.device('cpu'))
    model.eval()

    # Esegue l'inferenza
    infer(model=model, img_path=args.img_path, device=device)
