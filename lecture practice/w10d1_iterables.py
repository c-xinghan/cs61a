# Built-in functions & comprehensions practice

def q1(s, key=min):
    '''What are the indices of all elements in a list s that have the smallest absolute value?

    >>> q1([-4, -3, -2, 3, 2, 4])
    [2, 4]
    >>> q1([1, 2, 3, 4, 5])
    [0]
    '''

    # return [i for i, j in enumerate([abs(i) for i in s]) if j == key([abs(i) for i in s])]

    # alternate solution using map()
    return [i for i, j in enumerate(s) if abs(j) == min(map(abs, s))]

    # alternate solution using lambda, map() and filter()
    # return list(filter(lambda i: abs(s[i]) == min(map(abs, s)), range(len(s))))


def q2(s, key=max):
    '''What's the largest sum of two adjacent elements in a list s? (Assume len(s) > 1)

    >>> q2([-4, -3, -2, 3, 2, 4])
    6
    >>> q2([-4, 3, -2, -3, 2, -4])
    1
    '''

    # return key([j + s[i+1] for i, j in enumerate(s) if i+1 < len(s)])

    # alternate solution using zip()
    return key([sum(i) for i in zip(s[:-1], s[1:])])


def q3(s):
    '''Create a dictionary mapping each digit d to the lists of elements in s that end with d.
    
    >>> q3_dict = q3([5, 8, 13, 21, 34, 55, 89])
    >>> q3_dict[5]
    [5, 55]
    >>> q3_dict[8]
    [8]
    >>> q3_dict[3]
    [13]
    >>> q3_dict[1]
    [21]
    >>> q3_dict[4]
    [34]
    >>> q3_dict[9]
    [89]
    '''

    return {j%10 : [i for i in s if i%10 == j%10] for j in s}


def q4(s):
    '''Does every element equal some other element in s?
    
    >>> q4([-4, -3, -2, 3, 2, 4])
    False
    >>> q4([4, 3, 2, 3, 2, 4])
    True
    '''

    # return all([True if j in [y for x, y in enumerate(s) if x!=i] else False for i, j in enumerate(s)])

    # alternate solution using count()
    return all([s.count(i) > 1 for i in s])
