for num in range(1, 100):
    print(num, '...', end='')
    if num % 3 == 0:
        print('fizz', end='')
    if num % 5 == 0:
        print('buzz', end='')
    print('\n', end='')
