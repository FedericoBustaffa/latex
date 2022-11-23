# Comprensibilità e complessità

Per riuscire a ridurre la complessità e favorire la complessità

- Preferire interfacce "_strette_" che riducano i gradi di 
libertà
	- Interfaccia che favorisce http offre molti gradi di libertà
	- Definire tipi di dato semplifica i controlli e permette di 
	riuscire a scoprire più facilmente tipi di dato _malevoli_
- Un'interfaccia per gestire risorse di tipo diverso si 
semplifica e permette di definire un modello di dato comune 
ai vari moduli.
- Riconoscere operazioni idempotenti le quali possono essere 
eseguite ripetutamente senza errori.

## Identità

Le varie identità devono essere ben riconoscibili per 
autenticazione e controllo degli accessi.

La robustezza del sistema di controllo degli accessi dipende da
quella degli identificatori per l'identità.

Gli indirizzi IP non sono identificatori affidabili.

Gli identificatori dovrebbero essere _non riutilizzabili_ e 
robusti a _spoofing_.

## Trust Computing Base

Il TCB di un sistema è un sottoinsieme dei componenti del 
sistema che determina la **politica di sicurezza**.

In un sistema possiamo avere sottoinsiemi diversi con TCB 
diversi per riuscire ad avere maggiore modularità e scalabilità.

Ogni TCB dovrebbe essere _sospettoso_ di qualsiasi cosa arrivi 
dall'esterno della sua area di competenza, sia che si tratti 
di qualcosa che arriva dall'esterno del sistema sia che si 
tratti di qualcosa interno al sistema.

Questo permette di trovare ad esempio guasti di altri moduli 
del sistema.

Decomporre un sistema in parallelo fa sì che si soddisfi quasi 
automaticamente il **principio del privilegio minimo**.

## Tipi
Definito un tipo di dato conviene definire una funzione 
associata per il controllo e la validazione del tipo stesso.

Il controllo si decompone in:
- Verifica della correttezza della funzione associata.
- Verifica che ogni modulo che utilizza il tipo, invochi la 
funzione associata.
- Altri controlli sul codice dei vari moduli.

In molti linguaggi il meccanismo di incapsulamento e definizione
di tipi non è sicuro quanto si pensa in quanto, tramite 
_reflaction_ , _casting_ e altro si possono violare i tipi 
stessi.

# Design for change

Un sistema dovrebbe essere progettato per semplificare future 
modifiche, dovute alla scoperta di nuove vulnerabilità o per 
riuscire a soddisfare nuovi requisiti di sicurezza.

# Design for resilience

Un sistema dovrebbe essere progettato in modo che sia 
_resiliente_ agli attacchi.

Differenziazione e partizionamento di parti di sistema per 
riuscire a favorire l'indipendenza e la sicurezza dei diversi
moduli.

Implementazione di funzioni di sicurezza automatiche per 
ridurre le risposte agli attacchi.

## Rischio

I difensori devono minimizzare le informazioni esposte agli 
attaccanti.

Più il difensore conosce i metodi di attacco più sarà semplice
implementare meccanismi di sicurezza.

## Degradazione

Dato che non è possibile sapere sempre dove si presenterà una 
vulnerabilità, quello che si può fare è limitare il danno che 
un attacco può fare.

Il sistema dovrebbe essere progettato in modo tale che gli 
strati più interni, in quanto meno complessi, siano anche quelli
più robusti in quanto il progettista dovrebbe riuscire meglio
ad individuare tutte le vulnerabilità.

## Blast radius

Riuscire a prevedere come un attacco possa propagarsi e limitare
per l'appunto la propagazione partizionando aspetti del sistema.

## Failing Safe
Il sistema continua a funzionare anche quando le componenti 
di sicurezza hanno dei malfunzionamenti.

Per esempio si disattiva un firewall che non riesce più ad eseguire 
i suoi controlli di sicurezza.

## Failing Secure
Il sistema viene disattivato in modo da impedire ogni 
comportamento scorretto ma anche impedendo ogni funzionamento.