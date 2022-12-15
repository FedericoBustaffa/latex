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

### Bioinformatica

Approccio usato in bioinformatica si basa sulla generazione
di firme tramite allineamento di sequenze multiple.

Questo sistema mira a risolvere il problema nel creare una 
firma basata su exploit per un singolo worm polimorfo.

#### Approccio

Quello che si fa nella pratica è trasformare il traffico 
generato da un worm polimorfo in un insieme di sequenze di
caratteri da cui poi riuscire a generare una firma sotto forma di '**espressione regolare semplificata** in tre passi:
1. Analisi e allineamento del traffico generato dai worm.
2. Eliminazione del traffico rumoroso generato dal worm.
3. Generazione di una firma **SRE** ponendo vincoli di distanza
tra sequenze di byte invariati.

In questo modo vengono generate firme più specifiche per il
singolo worm.

#### Valutazione

La qualità di una firma generata tramite questo processo viene 
misurata in termini di:
- **Falsi positivi e negativi**: in fase di test sono stati 
usati sia shellcode semplici sia complesse quanto quelle che 
si possono trovare in circolazione.
	- Quello che si è notato per quanto riguarda i worm
	_sintetici_ (semplici e senza generazione di rumore) è che
	le firme generate sono uguali alle più specifiche firme
	conosciute in precedenza per quel worm. Si hanno inoltre
	un numero di falsi positivi tendente allo zero e nessun 
	falso negativo.
	- Risultati del tutto analoghi per quanto riguarda i test
	condotti su worm reali.
- **Deviazione di byte invarianti e deviazione della restrizione
sulla distanza**: i test condotti mostrano che la deviazione 
media delle firme generate è, in entrambi i casi, zero. Questo
ci dice che non vi è alcuna perdita e dunque le firme sono 
specifiche al massimo.

Altri test hanno mostrato come la generazione di rumore 
influenzi largamente l'accuratezza delle firme generate.

Con un rumore contenuto si ottengono ancora ottimi risultati
ma oltre una certa soglia le firme generate diventano troppo 
inaccurate.

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