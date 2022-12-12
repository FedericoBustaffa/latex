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