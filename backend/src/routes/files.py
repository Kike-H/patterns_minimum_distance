from fastapi import APIRouter
from modules.excel.convert import xlxs2Tuples
from modules.patterns.minimum_distance import get_class

files = APIRouter()

@files.post("/upload")
def upload(path_file: str) -> int:
    """This path get the class of a pattern with the data in excel"""
    return get_class(xlxs2Tuples(path_file, 1)[0], xlxs2Tuples(path_file, 0))
    
