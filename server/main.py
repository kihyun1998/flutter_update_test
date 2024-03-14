from fastapi import FastAPI
from fastapi.staticfiles import StaticFiles

app = FastAPI()

app.mount("/dist",StaticFiles(directory="dist"),name="dist")

# uvicorn main:app --reload