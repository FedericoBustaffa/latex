# Reazione ad un attacco

Ci sono due possibili tipi di reazione:

- Aggiungere contromisure
- Contrattacco

Il contrattacco è molto complesso in quanto l'attaccante usa 
infrastrutture di _command & control_ sacrificabili.

Per riuscire ad effettuare un contrattacco efficace si dovrebbe 
smantellare l'intera rete dell'attaccante andando a trovare tutti 
i nodi fino a risalire al sistema vero e proprio.

## Attribuzione

Per reagire in modo offensivo si deve risolvere il problema 
dell'**attribuzione**, ossia il problema di determinare chi ha 
condotto l'attacco.

In genere per riuscirci si deve monitorare in anticipo la struttura
da cui proviene l'attacco.

Un altro modo è quello dell'attribuzione delle TTPs utilizzate 
e sulla similarità del codice.

### Act of War

Le assicurazioni non coprono gli atti di guerra.

Se un attacco è sponsorizzato o eseguito da uno stato le 
assicurazioni lo classificano come atto di guerra che non 
è coperto da assicurazione.

---
# DNS

---
# Verifica del progetto di sistema
Principi che permettono di scoprire vulnerabilità non legati 
ad errori di programmazione.

Ogni sistema deve stabilire un compromesso tra verifica di 
questi principi e controlli.

1. **Economia dei meccanismi**: l'implementazione dei sistemi di 
sicurezza devono essere semplici e compatti.

2. **Fail-safe Default**: i meccanismi di protezione dovrebbero
vietare l'esecuzione di qualsiasia azione in assenza di diritti

3. **Mediazione completa**: il meccanismo di protezione dovrebbe
controllare l'accesso ogni volta ad ogni oggetto.

4. **Open Design**: il sistema deve rimanere sicuro finché 
l'attaccante non scopre la chiave di cifratura.

5. **Privilegio di separazione**: il meccanismo di protezione 
dovrebbe permettere l'accesso tramite più di un pezzo di 
informazione.

6. **Privilegio minimo**: ogni processo dovrebbe essere eseguito
con il numero minimo di diritti.

7. **Meccanismo comune**: si deve ridurre al minimo la 
condivisione di informazioni tra utenti. Ogni canale di 
condivisione può essere causa di vulnerabilità.

8. **Psychological Acceptability**: Il meccanismo di protezione
dovrebbe essere facile da utilizzare per l'utente finale.