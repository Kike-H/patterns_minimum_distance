from os import getcwd, mkdir, path, remove
from fastapi import APIRouter, UploadFile, File
from modules.excel.convert import xlxs2Tuples
from modules.patterns.minimum_distance import get_class

files = APIRouter()

@files.post("/upload")
async def upload(file: UploadFile = File(...)) -> int:
    """This path saves a temporary file and get the pattern's class with data in the excel file then remove the file"""
    uri = path.abspath(path.join(getcwd(),"../files/"))
    # If the folder doesn't exist created'
    try:
        mkdir(uri)
    except OSError:
        pass
    #  Set the the complete path
    uri += "/"+file.filename
    # Save the excel file
    with open(uri, "wb") as my_file:
        content = await file.read()
        my_file.write(content)
        my_file.close()
    # Get the number of class 
    c_value = get_class(xlxs2Tuples(uri,1)[0], xlxs2Tuples(uri,0))
    # Delete the excel file
    remove(uri)
    return c_value
