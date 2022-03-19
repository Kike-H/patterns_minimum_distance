from fastapi import FastAPI
from routes.files import files

app = FastAPI()

app.include_router(files)

@app.get('/')
def index():
    return "Hello word!"
    