# Rilevamento basato su firma

Le tecniche di rilevamento basate su firma si concentrano 
molto sui worm polimorfi e le firme stesse, in base alle loro
caratteristiche possono essere classificate in tre categorie:
**basate sul contenuto**, **basate sulla semantica** e 
**guidate dalle vulnerabilità**.

## Rilevamento tramite firme basate su contenuto

Tecnica a livello rete, basata sul riconscimento di sequenze 
di byte specifiche di alcuni worm.

Quando la sequenza letta corrisponde ad una sequenza 
identificata come traffico di un worm noto, il pacchetto 
viene etichettato come worm.

Per riuscire ad estrarre le firme si possono identificare 
sequenze comuni a vari worm oppure usare delle _honeypot_ per
catturare traffico illegittimo inviato verso indirizzi 
inutilizzati.

### Polygraph

Uno dei primi meccanismi usato per generare firme di worm 
polimorfi in modo automatico.

Si basa sull'assunzione che tutte le istanze di un worm 
polimorfo sono formate dalle stesse sottostringhe.

Nello specifico, questo strumento compara più sottostringhe
per riuscire ad identificare un worm che varia la sequenza 
di byte per ogni sua istanza.

#### Struttura

Il traffico passa attraverso un classificatore, il quale divide
il traffico in _sospetto_ e _innocuo_ basandosi su scanning 
dell'attività sulle porte oppure usando il traffico che passa
attraverso l'honeypot.

Il traffico sospetto viene poi passato ad un generatore di firme
il quale genera diverse classi di firma.

Se il traffico sospetto contiene diversi tipi di worm viene 
effettuata un'operazione di clustering in modo da raggruppare 
parti di traffico simili fra loro in un unico cluster e 
generare per ognuno di questi cluster una firma.

Le sequenze contigue di byte, dette **token**, sono selezionate 
in base alla loro lunghezza (minimo $\alpha$) e nel caso 
occorrano in almeno $K$ istanze su $n$ totali tra quelle 
rilevate nel traffico sospetto.

I _token_ estratti sono poi utilizzati per generare diverse 
classi di firma:
- **Conjunction signature**: insieme disordinato di token.
- **Token subsequence signature**: insieme ordinato di token.

Questi due tipi di firma possono essere espressi come 
espressioni regolari e usati negli attuali IDS.

D'altra parte la **Bayes signature** utilizza un modello 
probabilistico per associare un token ad un punteggio. Se 
il punteggio di un token è sopra una certa soglia viene 
etichettato come worm.

#### Valutazione

I tre diversi tipi di firma mirano a scoprire diversi tipi di 
comportamento dei worm. La sottosequenza di token è più 
specifica della congiunzione rendendola più resistente a 
tecniche di riordinamento dei bytes. Entrambe le tecniche 
sono tuttavia resistenti a cancellazione e inserzione di byte
che non fanno parte del token.

Dato che le firme di Bayes non cercano una corrispondenza 
esatta sono resistenti ad attacchi che includono token 
spazzatura per riuscire a incorporare più token nella firma
e rendere il rilevamento più complesso.

Di base, tutti e tre i tipi di firma riescono a rilevare worm
cifrano il loro corpo e mantengono una routine di decifrazione
invariata.

### Rilevamento efficiente basasto sul contenuto

Tecnica di rilevamento per worm zero-day si basa sull'analisi
e l'identificazione di pacchetti di pacchetti simili diretti
su più host.

#### Approccio

Il rilevamento si basa su quattro osservazioni facilmente 
identificabili sui worm più comuni:
- Destinazioni multiple di pacchetti simili
- Diffusione tramite client
- Ripetizione del corpo
- Piccole dimensioni

Per riuscire ad identificare nuovi worm, si cercano 
sottostringhe comuni nel contenuto dei vari pacchetti che 
viaggiano dai client verso diverse destinazioni.

Si fa uso di una cache contenente le varie sottostringhe 
incontrate e, associata ad ognuna di esse, una lista delle 
destinazioni a cui la sottostringa deve essere inviata.

Nel caso in cui arrivi un pacchetto con una sottostringa non
presente nella cache la si aggiunge con la relativa 
destinazione.

Nel caso in cui la sottostringa sia invece già presente e la 
relativa destinazione non appartenga già alla lista delle 
destinazioni la si aggiunge. Una volta aggiunta la nuova 
destinazione si compie un controllo sul numero di destinazioni
presenti nella lista. Se questo supera un valore soglia 
potrebbe essere indice del fatto che un worm sta venendo 
inviato su più macchine facendo scattare un **alert**.

La cache viene liberata degli elementi rimasti invariati 
per un certo periodo di tempo.

### Hamsa

Sistema automatizzato basato su network, veloce, resistente
al _rumore_ e agli attacchi.

Si basa sul fatto che un worm ben progettato si diffonde 
molto velocemente e gli approcci di rilevamento basati sulla
generazione di firme non rispondono abbastanza tempestivamente
contro attacchi zero-day.

Hamsa propone un meccanismo più veloce ed efficiente di 
Polygraph trattando i worm come stringhe di byte senza 
dipendere da alcun protocollo di rete o informazione da 
parte di qualche server.

Gli algoritmi di comparazione delle firme sono molto efficienti
e facilmente incorporabili all'interno di firewall.

#### Architettura

Similmente a Polygraph si compie una classificazione iniziale 
del traffico. Le due categorie di traffico vengono usate 
come input per il generatore di firme.

Inizialmente si estraggono i token che compaiono $\lambda$
volte nell'insieme di token di traffico sospetto.

Il valore $\lambda$ è una soglia che risparmia di analizzare 
tutti i token uguali nell'insieme ma solo una parte di essi.

I token vengono passati in seguito ad un modulo di 
identificazione dove vengono comparati con il traffico non 
sospetto per **specificità**.

Nel caso del traffico contenente un worm ottenga una 
corrispondenza questo viene marcato come worm.

#### Valutazione

Hamsa fa uso di due motori polimorfici per generare worm 
polimorfi per testare l'algoritmo di classificazione e 
rilavamento.

Rispetto a Polygraph riesce ad ottenere firme più specifiche 
con zero falsi negativi in assenza di rumore.

In presenza di rumore continua ad essere migliore di Polygraph
per specificità e continua a non generare falsi negativi. 
Genera tuttavia un basso numero di falsi positvi.

Se il rapporto tra rumore e dati è maggiore del 50% vengono
generate due firme. Una sicuramente giusta e l'altra dovuta 
al rumore nell'insieme di traffico innocuo.

In generale è stato osservato che, per riuscire a rilevare 
worm sconosciuti più facilmente, è meglio adottare un insieme 
del traffico sospetto più ampio.

### IDS basato sul payload

Questo metodo di rilevamento integra un processo di 
clustering multidimensionale del traffico basato sugli header
lato front-end con un processo di estrazione delle firme 
eseguito separatamente su ogni cluster nell'insieme dei 
cluster di traffico sospetto.

Il processo di clustering migliora la purezza degli insiemi
di traffico andando anche a ridurre la complessità
dell'analisi servendosi di un **albero dei suffissi**.

#### Architettura

Il sistema si compone di tre parti principali:
- Clustering multidimensionale e classificazione del traffico
- Estrazione e valutazione della firma dei worm
- Contenimento dei worm basato sul loro payload

L'analisi multidimensionale del traffico e il rilevamento 
basato sugli header permette di classificare il traffico e 
identificare meglio i vari cluster, dividendoli per ogni 
tipo di anomalia o attacco.

Per quanto riguarda l'estrazione delle firme dei worm viene
generato un albero dei suffissi basato sul contenuto dei 
pacchetti presenti nei cluster di traffico sospetto.In seguito
si visita ogni nodo dell'albero e, basandosi su due criteri,
si prende il prefisso di ogni nodo analizzato e si considera 
come firma di un worm.
- Il primo criterio mira a trovare stringhe relativamente 
lunghe che appaiono un certo numero di volte in un certo
intervallo di tempo per un certo cluster.
- Il secondo criterio mira a trovare stringhe brevi ma presenti
quasi sempre in instanze differenti di vari worm.

Firme che sono sottostringhe di altre e che appaionon quasi con
la stessa frequenza vengono rimosse in modo da generare firme
più specifiche e non ridondanti.

#### Valutazione

Il sistema fa uso di un sistema di tracciamento il quale 
considera intervalli di tempo di un minuto in cui vengono 
inviati quasi 80.000 pacchetti e il worm viene inserito con
una frequenza di 15 pacchetti al secondo, per un totale di 
quasi 900 pacchetti worm aggiunti.

Tali pacchetti vengono selezionati casualmente da un insieme
di 20 immagini differenti, ognuna lunga 100 byte e la quale 
condivide 15 byte posizionati casualmente nel payload.

Tutti i pacchetti worm utilizzano lo stesso indirizzo IP sulla
porta 110 e protocollo 6 ma, in modo casuale, generano IP e 
porte.

Tutte le firme vengono estratte correttamente dai cluster 
generati senza falsi positivi.

### SweetBait

Si tratta di una combinazione di tecniche per la prevenzione
ed il rilevamento di intrusioni.

Impiega diversi tipi di sensori posti su honeypot per rilevare
e intercettare traffico sospetto. Il primo (Argos) un 
meccanismo con un alto livello di interazione e il secondo
(SweetsPot) a più bassa interazione.

Questo meccanismo genera firme automaticamente worm che 
scansionano spazi di indirizzi IP casuali, senza possedere alcuna conoscenza a priori.

Argos viene usato per generare firme compatibili con worm
che invece non effettuano scansioni degli indirizzi IP.

Un aspetto particolare di questo meccanismo è che inserisce 
una shellcode a scopo forense, sostituendo la shellcode 
utilizzata dal worm per iniettare codice malevolo.

#### Architettura

SweetBait si compone di più moduli con ruoli distinti: 
**sensori** ed **elementi di controllo**.

Le honeypot ed il sistema di rilevamento e prevenzione 
sono i sensori, mentre i centri di controllo e il centro
di controllo globale rappresentano gli elementi di controllo.

Le honeypot sono impostate per ricevere traffico destinato
ad indirizzi IP inesistenti della sottorete di riferimento.

Questi dati sono filtrati in modo da escludere il traffico
che si sa essere innocuo.

Tutto il resto viene trattato come traffico sospetto e 
processato per riuscire a generare firme per il rilevamento
a livello network di intrusioni.

Le firme generate sono poi passate al centro di controllo 
dove sono comparate alle firme conosciute e, in base al 
numero di volte che la firma viene riscontrata il centro
di controllo decide se trasmetterla alle componenti di 
rilevamento e prevenzione.

Queste componenti danno un feedback al centro di controllo
sul numero di volte in cui hanno riscontrato una corrispondenza
con le firme che stanno monitorando.

Il centro di controllo a questo punto scambia le firme e 
le analisi statistiche con un centro di controllo globale
il quale inizia una collaborazione con istanze multiple 
di SweetBait.

Argos invece utilizza tecniche di memory tainting per riuscire
a rilevare violazioni come stack o heap overflow e generare un
alert.

Le firme sono generate automaticamente da honeycomb, un plugin
di honeyd, il quale scansione il traffico in ingresso e rileva
sequenze ripetute utilizzando l'algoritmo della sottostringa 
comune più lunga.

#### Valutazione

SweetBait è stato eseguito per periodi di tempo lunghi 
24 ore con tutti i sensori di SweetSpot per riuscire a
generare quante più firme possibili. In poche ore si è
riuscite ad ottenere un gran numero di firme.

A seguire si è adottato un meccanismo di specializzazione
delle firme per risucire a passare da un numero di firme 
nell'ordine delle decine di migliaia all'ordine delle decine.

I test sono stati effettuati con una componente di rilevamento
di intrusioni al livello network e una honeypot le quali 
generavano di continuo un alert per effettuare uno stress test
sul centro di controllo e riuscire a trovare un eventuale 
collo di bottiglia.

Argo è stato invece eseguito un Windows2000 e attaccato con 
una serie di exploit presenti nel framework Metasploit.

Il test condotto includeva diversi tipi di buffer overflow
e non ha riscontrato né falsi negativi né falsi positivi.

## Rilevamento flessibile di firme basato su contenuto

Questo approccio lavora a livello di byte ed è definito 
_flessibile_ in quanto non mira a trovare corrispondenze 
tra stringhe o sottostringhe dei pacchetti in arrivo.

Quello che fa invece è generare firme che descrivono come 
i byte sono organizzati.

### PAYL

Si tratta di un meccanismo di rilevamento di anomalie in 
grado di generare firme per worm zero-day. Rileva codice 
anomalo e lo confronta con il traffico in uscita sulle stesse
porte.