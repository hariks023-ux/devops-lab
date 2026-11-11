# devops-lab

A minimal Flask app with a health check endpoint.

## Run

```bash
pip install -r requirements.txt
python app.py
```

Then: `curl http://localhost:5000/health` → `{"status": "ok"}`
