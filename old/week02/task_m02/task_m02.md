## task02 - Mehrprogrammbetrieb und Scheduling
    
### task02_a

Wenn ein Prozess mehrfach in der Liste des Round-Robin Schedulers aufgefÃ¼hrt wird, erhÃ¤lt er dadurch eine hÃ¶here PrioritÃ¤t gegenÃ¼ber anderen Prozessen. Das bedeutet, dass er Ã¶fter die CPU-Zeit zugewiesen bekommt als andere Prozesse in der Liste. Wenn der Prozess blockiert wird, wird er aus der Liste entfernt und spÃ¤ter wieder in die Liste eingefÃ¼gt, wodurch er erneut eine hÃ¶here PrioritÃ¤t erhÃ¤lt. Wenn dieser Vorgang mehrfach auftritt, kann dies dazu fÃ¼hren, dass der Prozess eine unverhÃ¤ltnismÃ¤ÃŸig groÃŸe Menge an CPU-Zeit erhÃ¤lt und andere Prozesse vernachlÃ¤ssigt werden.

### task02_b

Es gibt einige GrÃ¼nde, warum das mehrfache Eintragen von Prozessen in die Liste erlaubt sein kÃ¶nnte. Ein Grund kÃ¶nnte darin bestehen, dass bestimmte Prozesse eine hÃ¶here PrioritÃ¤t als andere haben, z. B. kritische Prozesse, die fÃ¼r die Systemfunktionen wichtig sind. Indem man diese Prozesse mehrfach in die Liste eintrÃ¤gt, stellt man sicher, dass sie ausreichend CPU-Zeit erhalten und das System reibungslos lÃ¤uft. Ein weiterer Grund kÃ¶nnte darin bestehen, dass bestimmte Prozesse blockierend sind und daher aus der Liste entfernt werden mÃ¼ssen, bis sie wieder bereit sind, CPU-Zeit anzufordern. Durch mehrfaches Eintragen in die Liste wird sichergestellt, dass der blockierende Prozess bei seiner Wiederherstellung schnell wieder in die Liste aufgenommen wird und seine CPU-Zeit erhalten kann.

### task02_c

Das mehrfache Eintragen desselben Prozesses in die Liste kann zu einigen Problemen fÃ¼hren. Wie bereits erwÃ¤hnt, kann es dazu fÃ¼hren, dass ein bestimmter Prozess eine unverhÃ¤ltnismÃ¤ÃŸig groÃŸe Menge an CPU-Zeit erhÃ¤lt und andere Prozesse vernachlÃ¤ssigt werden. Dies kann zu EngpÃ¤ssen im System fÃ¼hren und die Leistung beeintrÃ¤chtigen. Ein weiteres Problem ist, dass das mehrfache Eintragen eines blockierten Prozesses dazu fÃ¼hren kann, dass er zu oft aus der Liste entfernt und wieder eingefÃ¼gt wird, was zu zusÃ¤tzlichen Overhead und VerzÃ¶gerungen fÃ¼hren kann. SchlieÃŸlich kann das mehrfache Eintragen eines Prozesses auch dazu fÃ¼hren, dass die Liste unnÃ¶tig groÃŸ wird und die Verwaltung der Liste schwieriger wird.20