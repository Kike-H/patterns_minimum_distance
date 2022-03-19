from fastapi import APIRouter, UploadFile, File

files = APIRouter()

@files.post("/upload")
def upload(file: UploadFile = File(...)) -> str:
    """This path get the class of a pattern with the data in excel"""
    return file.filename

