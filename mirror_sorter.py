with open('mirrorlist','r') as source:
    lines = list(source.readlines())
    paises = {}
    links = []
    pings = {}
    for idx, line in enumerate(lines):
        if line.startswith('Server ='):
            paises[lines[idx-1]]= paises.get(lines[idx-1],[]) + [line]
            links.append(line)

    #print(pais)
    f = open('mirrorlist.new', 'w')

    print('## Brazil', file=f)
    for link in paises['## Brazil\n']:
        print(link, file=f, end='')

    for pais in sorted(paises):
        print('\n', file=f)
        print(pais, file=f, end='')
        for link in paises[pais]:
            print(link, file=f, end='')

