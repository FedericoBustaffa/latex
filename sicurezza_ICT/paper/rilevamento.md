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
occorrano in almeno in $K$ istanze su $n$ totali tra quelle 
del rilevate nel traffico sospetto.

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