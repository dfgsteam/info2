import pandas as pd

# task01.01.01
erstSemester = pd.read_csv("uebung09-data./ErstSemester.csv")

# task01.01.02
print(erstSemester.head(10))

# task01.02.01
menge = erstSemester['Matrikelnummer'].count()
mann = erstSemester[erstSemester['Geschlecht'] == 'männlich']['Matrikelnummer'].count() / menge
print(f"Menge Erstsemester: {menge}; Männlich: {mann*100}%, Weiblich: {(1-mann)*100}%")

# task01.02.02
haus = erstSemester.groupby('Haus').count()
liste = []
for index, row in haus.iterrows(): liste.append([row["Vorname"], index])
liste.sort()

for index, item in enumerate(liste):
    print(f"Haus: {item[1]} Menge: {item[0]}{' - meisten Studierenden' if index == 0 else ''}")
    
# task01.03.01
neuErstSemester = erstSemester.assign(Name = erstSemester['Vorname'] + ' ' + erstSemester['Nachname']).drop(["Vorname", "Nachname"], axis=1)

# task01.03.02
neuErstSemester = neuErstSemester.assign(Benutzername = erstSemester['E-Mail'].apply(lambda x: x.split("@")[0]))


print(neuErstSemester)