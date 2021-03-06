def get_class(pattern: tuple[float], data: tuple[tuple[float]]) -> int:
    """This method return a string with the number class"""
    values: list[float] = []

    # Get all the vectors in data
    for vector in data:
        pp_1 = 0
        pp_2 = 0
        # Make product point for both parts
        for i in range(0,len(vector)-1):
            pp_1 += vector[i]*pattern[i]
            pp_2 += vector[i]*vector[i]
         # Calculate the max value between the two vectors and to values 
        values.append(pp_1-(0.5*pp_2)) 
    # Get the index of maximum value and get the class in the same index in data 
    return int(data[values.index(max(values))][-1])


        
