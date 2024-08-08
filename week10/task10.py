from typing import Counter
from matplotlib import pyplot as plt


alphabet = "ABCDEFGHIJKLMNOPQRSTUVWXYZ"
def char_to_index(c):
    return (alphabet.index(c.upper()))

def index_to_char(n):
    return alphabet[n % len(alphabet)]

def caesar(key, plain, deciphering=False):
    k = char_to_index(key) + 1
    if (deciphering): 
        k = -k
    c = ""
    for p in plain:
        if (p not in alphabet ):
            raise ValueError('"' + p + '" is not an alphabet charater') 
        c = c + index_to_char(char_to_index(p) + k)
    return c

b = "REPUBLIK"
ret = ""

for run in range(10000):
    print(len(b))
    b += caesar(caesar(b[1], b[3]), caesar(b[6], b[7]))
    ret += b[0]
    b = b[1:]
    
print(b)
print(ret)

print(ret.find("REPUBLIK"))


counter = Counter(char.lower() for char in ret if char.isalpha())

# Daten für das Diagramm vorbereiten
letters = list(counter.keys())
frequencies = list(counter.values())

# Balkendiagramm erstellen
plt.figure(figsize=(10, 6))
plt.bar(letters, frequencies, color='blue')
plt.xlabel('Buchstaben')
plt.ylabel('Häufigkeit')
plt.title('Häufigkeit der Buchstaben im Text')
plt.show()


