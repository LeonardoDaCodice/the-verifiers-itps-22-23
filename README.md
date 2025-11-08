# 🧠 The Verifiers – Flask Web Application  
**Progetto per l’esame di Ingegneria del Software – A.A. 2022/2023**

---

## 📄 Descrizione generale
**The Verifiers** è un sistema web basato su **Python (Flask)** progettato per verificare l’attendibilità di notizie e immagini.  
Integra un modulo di intelligenza artificiale capace di riconoscere immagini manipolate, combinando **analisi dei metadati**, **Error Level Analysis (ELA)** e **reti neurali convoluzionali (CNN)**.

Il progetto nasce come elaborato di gruppo per l’esame di *Ingegneria del Software* presso il **Dipartimento di Informatica dell’Università degli Studi di Bari Aldo Moro**, e ha come obiettivo principale l’apprendimento delle **tecniche di progettazione e sviluppo di sistemi software solidi**, secondo i principi dell’ingegneria del software (analisi, design, implementazione, testing e documentazione).

Oltre alla componente AI, il sistema integra anche un’**API di news** che permette di:
- visualizzare notizie in tempo reale;
- gestire e archiviare automaticamente gli articoli nel database.

---

## 🧱 Struttura del progetto

```

the-verifiers-itps-22-23/
│
├── app.py                       # Entry point dell’app Flask
├── requirements.txt              # Dipendenze del progetto
├── .env.example                  # Esempio di configurazione ambiente
├── .flaskenv                     # Variabili Flask per debug
├── README.md                     # Documento principale
│
├── database/
│   └── theverifiersdb.sql        # Struttura del database + dati di esempio
│
├── documentation/
│   └── Documentazione_The_Verifiers_Ingegneria_2023.pdf  # Documentazione completa
│
├── templates/                    # Template HTML per interfacce utente e admin
├── static/                       # File CSS, JS e risorse statiche
├── Image-Manipulation-Detection/ # Modulo AI per verifica immagini
└── temp/                         # Cartella temporanea per immagini analizzate

````

---

## ⚙️ Installazione

### 1️⃣ Clonare il repository
```bash
git clone https://github.com/LeonardoDaCodice/the-verifiers-itps-22-23.git
cd the-verifiers-itps-22-23
````

### 2️⃣ Creare l’ambiente virtuale

```bash
python -m venv venv
venv\Scripts\activate
```

### 3️⃣ Installare le dipendenze

```bash
pip install -r requirements.txt
```

Ottimo, Salvatore 👏
La tua versione è già **chiara e ben scritta**, ma possiamo renderla un filo più scorrevole e senza piccole ripetizioni (es. “puoi… puoi…”), mantenendo lo stesso tono compatto e professionale.

Ecco la versione **ottimizzata e pronta per il README** 👇

---

### 4️⃣ Configurare le variabili d’ambiente

Crea un file **`.env`** nella root del progetto (puoi copiare e rinominare `.env.example`) e inserisci i parametri di connessione al database:

```env
MYSQL_HOST=localhost
MYSQL_USER=root
MYSQL_PASSWORD=        # Inserisci la password MySQL (se impostata)
MYSQL_DB=theverifiersdb
SECRET_KEY=myflaskkey123
````

> 💡 *La `SECRET_KEY` serve per la sicurezza delle sessioni Flask.*
> Generane una nuova eseguendo da terminale:
> 
> `python -c "import secrets; print(secrets.token_hex(16))"`


---

## 💾 Database

Importare il file:

```
database/theverifiersdb.sql
```

In **phpMyAdmin**:

1. Crea un database chiamato `theverifiersdb`;
2. Clicca su **Importa** e carica il file SQL.

Il file include la **struttura completa** delle tabelle e **dati fittizi di esempio**, così da poter testare immediatamente le funzionalità principali del sistema (login, verifica, segnalazioni, news).

---

## 🚀 Avvio del progetto

Avvia il server Flask in modalità debug:

```bash
flask --debug run
```

Poi apri [http://localhost:5000](http://localhost:5000) nel browser.

---

## 🧩 Componenti principali

| Componente                                                         | Descrizione                                                            |
| ------------------------------------------------------------------ | ---------------------------------------------------------------------- |
| **[app.py](app.py)**                                               | Backend Flask: gestione utenti, login, verifica, segnalazioni, routing |
| **[templates/](templates/)**                                       | Template HTML per utenti e amministratori                              |
| **[static/](static/)**                                             | File CSS e script JS per il frontend                                   |
| **[database/](database/)**                                         | Struttura e dati di esempio del database MySQL                         |
| **[documentation/](documentation/)**                               | Documentazione PDF con diagrammi UML, architettura e modelli           |
| **[Image-Manipulation-Detection/](Image-Manipulation-Detection/)** | Modulo AI per la verifica delle immagini manipolate                    |
| **[temp/](temp/)**                                                 | Directory temporanea per immagini analizzate                           |

---

## 🧠 Modulo di analisi delle immagini (AI Integration)

Il progetto integra il modulo open-source **[Image-Manipulation-Detection](https://github.com/z1311/Image-Manipulation-Detection)**,
che consente di rilevare immagini modificate tramite analisi a due livelli:

1. **Metadata Analysis** → Identifica firme di software di editing (es. Photoshop).
2. **Error Level Analysis (ELA)** → Evidenzia differenze di compressione dovute a manipolazioni.

L’output ELA viene fornito in input a una **rete neurale convoluzionale (CNN)** addestrata sul dataset [**CASIA Image Tampering Dataset**](https://www.ee.columbia.edu/ln/dvmm/downloads/AuthSplicedDataSet/AuthSplicedDataSet.htm), per classificare l’immagine come:

* 🟢 *Autentica*
* 🔴 *Manipolata*

### 🔧 Integrazione nel backend Flask

Durante la verifica, Flask esegue automaticamente:

```python
python Image-Manipulation-Detection/analyze.py -p <immagine_caricata>
```

Il risultato viene poi visualizzato nella pagina `verifica.html`.

📄 Ulteriori dettagli tecnici sono presenti nel file
[`Image-Manipulation-Detection/README.md`](Image-Manipulation-Detection/README.md)

---

## 🌍 Integrazione con API di notizie

Il sistema integra l’API di **[NewsAPI.org](https://newsapi.org/)**, che consente di:

* Recuperare automaticamente notizie aggiornate in tempo reale;
* Visualizzarle nella dashboard utente;
* Memorizzarle nel database per successive analisi e verifiche.

---

## 🖼️ Screenshot del sistema

| Pagina                                                            | Descrizione                                                     |
|-------------------------------------------------------------------|-----------------------------------------------------------------|
| ![Home](/static/schreenshots/Home_.png)                           | Interfaccia principale del sistema                              |
| ![Verifica Immagine](/static/schreenshots/Verifica_.png) | Schermata con i pulsanti di verifica (Immagine, Dominio, Video) |
| ![Gestione Notizie](/static/schreenshots/Notizie_.png)              | Visualizzazione notizie tramite API                             |
| ![Login](/static/schreenshots/Login_.png)                           | Interfaccia di accesso utente e amministratore                  |
---

## 📘 Documentazione tecnica

La documentazione completa del progetto è disponibile in:
📁 `documentation/Documentazione_The_Verifiers_Ingegneria_2023.pdf`

Contiene:

* Product Backlog e Sprint Report
* Diagrammi UML (Casi d’uso, Sequenza, Classi, Componenti, Deployment)
* Specifiche funzionali e non funzionali
* Architettura del sistema
* Modello logico e fisico del database

---

## 👥 Team di sviluppo

Progetto sviluppato per l’esame di **Ingegneria del Software** – Politecnico di Bari (A.A. 2022/2023)

**Team di sviluppo:**

- 🧑‍💻 [Davide Poli](https://github.com/Bonz0Sbronz0)  
- 🧑‍💻 [Salvatore Forte](https://github.com/LeonardoDaCodice)  
- 🧑‍💻 [Roberto Pio Selvaggi](https://github.com/Roberto1512)
- 🧑‍💻 [Fabio Papapicco](https://github.com/DwarfOTB)  

---

## 🧾 Licenza

Questo progetto è distribuito per **scopi didattici e non commerciali**.
Il modulo “Image-Manipulation-Detection” è incluso nel rispetto della licenza open-source originale.

---

## 🌐 Riferimenti utili

* [Repository principale del progetto – The Verifiers](https://github.com/LeonardoDaCodice/the-verifiers-itps-22-23)
* [Modulo AI – Image Manipulation Detection](https://github.com/z1311/Image-Manipulation-Detection)
* [API News – NewsAPI.org](https://newsapi.org/)
* [Flask Documentation](https://flask.palletsprojects.com/)
* [Fotoforensics – Error Level Analysis](http://fotoforensics.com/tutorial-ela.php)
* [CASIA Dataset – Columbia University](https://www.ee.columbia.edu/ln/dvmm/downloads/AuthSplicedDataSet/AuthSplicedDataSet.htm)


