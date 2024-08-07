# task01.01
def showLit(a: tuple[str, bool]):
    return a[0] if a[1] else f"~{a[0]}"

print(showLit(('A', False)) + "\n" + showLit(('B', True)))

# task01.02
def showClause(a: list[tuple[str, bool]]):
    ret = ""
    for index, item in enumerate(a):
        ret += f"{showLit(item)}{' v ' if index != (len(a)-1) else ''}"
    return ret

def showCNF(a: list[list[tuple[str, bool]]]):
    ret = ""
    for index, item in enumerate(a): 
        ret += f"({showClause(item)}){' ^ ' if index != (len(a)-1) else ''}"
    return ret

a = [('B', False)]
b = [('A', True), ('B', True), ('C', False)]
c = [a, b]

print(f"{showClause(a)}\n{showClause(b)}")
print(f"{showCNF(c)}")

# task01.03
def alphaLit(lit: tuple[str, bool], alpha: list[str]):
    for item in alpha: 
        if showLit(lit) == item: return True
    return False

def alphaClause(clause: list[tuple[str, bool]], alpha: list[str]):
    for lit in clause:
        if alphaLit(lit, alpha): return True
    return False

def alphaCNF(cnf: list[list[tuple[str, bool]]], alpha: list[str]):
    temp = True
    for clause in cnf:
        if not alphaClause(clause, alpha): temp = False
    return temp

alpha = ['A', 'B']

print(alphaLit(('A', True), alpha))
print(alphaLit(('B', False), alpha))
print(alphaLit(('C', True), alpha))
print(alphaClause(a, alpha))
print(alphaClause(b, alpha))
print(alphaCNF(c, alpha))

# task01.04

d = [[('B', True)], [('A', True)]]
e = [[('B', False), ('A', True)], [('A', False)]]

print(alphaCNF(d, alpha))
print(alphaCNF(e, alpha))

# task01.05

