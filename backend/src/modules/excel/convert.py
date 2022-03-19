import xlrd

def xlxs2Tuples(uri: str, sheet: int) -> tuple[tuple[float]]:
    """This method return a tuple with data in a excelf file"""
    data: list[tuple] = []

    # Open the file and sheet 
    book = xlrd.open_workbook(uri)
    sheet = book.sheet_by_index(sheet)

    for i in range(sheet.nrows):
        vector: list[float] = []
        for y in range(sheet.ncols):
            try:
                # Try to create a vector without strings
                vector.append(float(sheet.cell_value(i, y)))
            except:
                pass
            # Add the vector to the data
        if(len(vector) != 0):
            data.append(tuple(vector))
    return tuple(data)




    
