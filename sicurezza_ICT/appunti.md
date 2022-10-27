# Rilevamento intrusioni

## Basato sulla specifica

L'intrusione è dedotta tramite l'analisi delle specifiche 
confrontata con l'analisi dei diritti dei vari utenti.

Se un utente viola la specifica è perché sta provando ad attaccare
il sistema.

- **Dinamico**: Le informazioni sul comportamento del
programma vengono raccolte e confrontate con le specifiche del 
programma.
- **Statico**: Questo approccio, in generale, non è
applicabile perché non si riesce a definire bene se un 
comportamento sia dovuto ad un input  particolare (legale) o ad un
intrusione.
- **Ibrido**: Il compilatore crea una specifica e le
osservazioni vengono raccolte per essere confrontate con il
comportamento del programma integrando quei casi che non possono
essere risolti staticamente

## Basato su firma

Si rileva l'attacco mediante l'analisi di alcuni comportamenti e 
dati che caratterizzano un determinato attacco (**firme**).

Una volta che si verifica un attacco se estrapola la firma e la si 
memorizza in una database per il rilevamento di futuri attacchi.

Tutto ciò che differisce da una firma memorizzata nel database è 
consentito. Nel momento in cui viene compiuta un'azione analoga a 
ad una presente in una firma nel database, viene etichettata come 
azione di un attacco.

Fare un rilevamento basato su firme in rete non è banale dato che 
si deve tenere di conto dell'efficienza dell'IDS messo in rete, 
dell'implementazione della rete, della connessione e così via.

## Polimorfismo di malware e virus

Per ottenere virus sempre diverse si potrebbe cifrare il corpo 
del virus per in modo da ottenere virus sempre diversi dai quali 
non è possibile rilevare una firma.

## Sandbox

Macchine virtuali dove eseguire codice di un attaccante.

I malware moderni riescono a capire di essere eseguiti in una 
sandbox e non rivelano il loro comportamento pericoloso fino a che
non superano i test per essere eseguiti sul sistema operativo 
(magari con permessi di _root_).

## Basato su regole

Si tratta di un modo per generalizzare il metodo basato su firma 
in cui si usa un insieme di regole che _matchano_ i pacchetti.

In questo modo abbiamo regole più astratte che riescono a gestire
anche modifiche nel contenuto dei pacchetti.

Un IDS molto popolare è **Snort**.

## Offuscamento del codice

L'obbiettivo è rendere inefficienti gli strumenti di _reverse 
engineering_ che rendono possibile risalire dal codice in 
linguaggio macchina al codice ad alto livello.

