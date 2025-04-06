# RPA Challenge - Robot Framework Automation

This project is an automation solution for the **RPA Challenge**, built using **Robot Framework** and the **Browser Library (Playwright)**. It automates the process of downloading an Excel file, extracting its data, and submitting it via a web form.

---

## Features

- Automatically downloads the Excel file from the challenge website  
- Parses Excel to JSON using a custom Python utility  
- Populates a web form with the extracted data  
- Submits the form for each record

---

## Project Structure

```
📁 rpa-challenge/
├── ExcelToJson/
│   └── excel_to_json.py
├── tests/
│   └── rpa_challenge.robot
├── requirements.txt
└── README.md
```

---

## Requirements

- Python 3.x  
- Robot Framework  
- Browser Library (based on Playwright)  
- Pandas  
- openpyxl

---

## Setup Instructions

### 1. Create and activate a virtual environment

- **Windows:**
  ```bash
  python -m venv .venv
  .venv\Scripts\activate
  ```

- **Mac/Linux:**
  ```bash
  python3 -m venv .venv
  source .venv/bin/activate
  ```

### 2. Install dependencies

```bash
pip install -r requirements.txt
```

### 3. Install Playwright browsers

```bash
python -m playwright install
```

---

## Running the Automation

```bash
rfbrowser init
robot tests/rpa_challenge.robot
```

> Make sure your browser is not blocking pop-ups or being interrupted by security settings.

---

## License

This project is open-source and available under the [MIT License](LICENSE).

---

## Acknowledgments

Thanks to the [RPA Challenge](https://rpachallenge.com/) community for providing a fun automation task!
