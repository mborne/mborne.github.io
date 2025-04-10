# opencv-calibration

Test de l'utilisation de OpenCV en Python pour calibrer une camera et redresser l'image (2019)

## Pré-requis

* Imprimer [un échiquier de 8x8](https://fr.m.wikipedia.org/wiki/Fichier:Chess_Board.svg)
* Python 3
* OpenCV :

```bash
pip install opencv-python
```

## Principe de fonctionnement

* Capture des images de la webcam
* Calibration à partir des premières photos de l'échiquier
* Redressage de l'image après calibration

## Utilisation

```bash
python main.py
```

## Resources

* [docs.opencv.org - Camera Calibration](https://docs.opencv.org/4.11.0/dc/dbb/tutorial_py_calibration.html)
