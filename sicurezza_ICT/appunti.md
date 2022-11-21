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