# Worm polimorfi

Questo tipo di attacco rappresenta uno dei maggiori problemi
di sicurezza informatica poiché hanno vari punti di forza
tra cui:
- Rapidità di propagazione da un host all'altro.
- Modifica della propria rappresentazione.
- Cifratura del proprio corpo con chiavi diverse.
- Uso di exploit zero-day per violare i sistemi tramite 
vulnerabilità non ancora scoperte

Utilizzando tecniche di modifica del proprio corpo, un singolo
worm possiede diverse possibili _signature_, il che rende 
difficile ottenere una loro _fingerprint_.

Questo fa sì che i meccanismi di rilevamento tradizionali e 
quelli basati su firma non riescano ad individuare queste 
minacce.

I moderni worm zero-day sfruttano
- Scansioni multiple delle vulnerabilità per l'identificazione 
mirata delle vittime.
- Meccanismi di mutazione per riuscire ad evadere i controlli 
di sicurezza.
- Exploit mirati per riuscire ad attaccare host vulnerabili.
- Shell remote per riuscire ad aprire porte sull'host 
compromesso in modo da comunicare.

Se questi attacchi non vengono rilevati e contenuti in tempo 
possono creare seri danni alla rete o alle macchine degli 
utenti.

Molti worm sono stati indagati a fondo così come i metodi di 
rilevamento per questi ultimi e nonostante la grande ricerca 
in questo ambito non si possiede ancora un meccanismo di 
rilevamento completo in ogni possibile aspetto.

## Attacchi zero-day

Un attacco zero-day è tale se questo utilizza un exploit che 
sfrutta vulnerabilità zero-day, ossia vulnerabilità di cui 
ancora il proprietario del sistema non conosce l'esistenza 
o che ancora non è riuscito a patchare.

Tra gli exploit conosciuti più pericolosi visti fino ad ora 
abbiamo:
- **Hydraq Trojan**: furto di informazioni dalle compagnie.
- **Stuxnet**: infettava i controller logici programmabili 
con tecniche avanzate di crittografia, exploit e utilizzo 
di iniezioni di codice tutt'ora sconosciute.
- **Duqu**: utilizzava exploit zero-day per violare i kernel
di Windows.

Gli attacchi zero-day si verificano nella finestra di tempo
che si crea dal momento in cui una vulnerabilità viene 
sfruttata da un exploit fino al momento in cui si inizia a 
sviluppare una contromisura per quella vulnerabilità.

In generale, stimare la lunghezza di questa finestra è 
difficile e potrebbe dipendere da molti fattori. Così come gli 
attaccanti ovviamente non dichiarano mai la scoperta di una 
vulnerabilità quando la trovano, le compagnie non non 
rilasciano informazioni per motivi di immagine o di sicurezza.

Nonostante la finestra di cui abbiamo appena parlato potrebbe 
durare anni, classificare alcune vulnerabilità, e di conseguenza 
alcuni attacchi come "zero-day" è abbastanza difficile dato che, 
in genere, le informazioni necessarie a tal fine non vengono
rese pubbliche.

### Ciclo di vita di una vulnerabilità

Uno studio classifica il **ciclo di vita** le vulnerabilità in
cinque categorie sulla base di fattori come la **disponibilità
di patch** e **codice di altri exploit** che potrebbe 
incrementare la probabilità di attacchi zero-day.
- **Attacco zero-day**: la vulnerabilità viene scoperta da un 
gruppo malevolo e non viene resa pubblica.
- **Attacco pseudo zero-day**: la vulnerabilità ha già una 
patch disponibile ma per qualche motivo non è stata ancora 
applicata.
- **Potenziale attacco pseudo zero-day**: la vulnerabilità 
ha un'alta probabilità di essere sfruttata tramite un exploit
nonostante ci sia una patch disponibile.
- **Potenziale per un attacco**: la vulnerabilità viene resa 
nota in dettaglio e il codice per eseguire exploit è noto. Non
esiste tuttavia una patch su larga scala rendendo la 
vulnerabilità in questione del primo tipo nel momento in cui
si verifica un attacco.
- **Passivo**: Non esiste ancora un exploit per la 
vulnerabilità.

### Sviluppo di un exploit zero-day

Per sviluppare un exploit zero-day si deve in prima battuta 
scoprire una nuova debolezza del sistema, dopodiché si procede
con lo sviluppo dell'exploit vero e proprio. Il processo 
comprende quattro fasi:
1. **Analis**: si tratta di una fase preliminare in cui si 
cerca di accrescere la conoscenza del sistema e dei relativi 
protocolli.
2. **Fuzz**: fase opzionale in cui si usa un _fuzzer_ in grado
di produrre input di vario genere per riuscire a stressare il
programma e scoprire vettori d'attacco per funzionalità del 
sistema poco utilizzate e di conseguenza più soggette a bug 
ed errori.