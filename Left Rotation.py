def rotLeft(a, d):
    frontArr = a[0:d]
    backArr = a[d:]

    return backArr + frontArr