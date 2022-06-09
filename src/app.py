import socket

from fastapi import FastAPI

import uvicorn

app = FastAPI()

@app.get("/")
def get_host():
    return socket.gethostname()

