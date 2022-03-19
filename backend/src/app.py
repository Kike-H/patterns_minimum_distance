from modules.patterns.minimum_distance import get_class
from modules.excel.convert import xlxs2Tuples

if __name__ == '__main__':
    data = xlxs2Tuples("/Users/kickehernandezd./Desktop/Book1.xlsx", 0)
    vector = xlxs2Tuples("/Users/kickehernandezd./Desktop/Book1.xlsx", 1)[0]

    print(get_class(vector, data))

    