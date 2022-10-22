# Tutorial Markdown

## Headings

Gli headings si ottengono con il #. Più cancelletti inseriamo, più piccolo sara l'heading.

```markdown
# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6
```

# Heading 1
## Heading 2
### Heading 3
#### Heading 4
##### Heading 5
###### Heading 6



---

## Lists

Per le liste ordinato, possiamo utilizzare il simbolo `1.`

Mentre per le liste non ordinate possiamo utilizzare `-` , `*` o `+`

```markdown
1. Primo elemento
1. Secondo elemento
1. Terzo elemento

- Elemento
- Elemento
- Elemento
```

1. Primo elemento
1. Secondo elemento
1. Terzo elemento

- Elemento
- Elemento
- Elemento
---

## Elementi inline

Il testo in corsivo si ottiene inserendo del testo tra un `*` o un `_`

```markdown
_testo in corsivo con underscore_

*testo in corsivo con asterisco*
```
_testo in corsivo con underscore_

*testo in corsivo con asterisco*


Il testo in grassetto si ottiene inserendo del testo tra due `**` o due `__`

```markdown
__testo in grassetto con due underscore__

**testo in grassetto con due asterischi**
```
__testo in grassetto con due underscore__

**testo in grassetto con due asterischi**

---

## Le citazioni (Blockquote)

I blockquote si ottengono con la parentesi angolare (`>`)

> Questa è una citazione.
> Rimango sulla stessa linea.

---

## Immaigni

LE immagini vengono mostrate con la sintassi seguente:

```markdown
![Questo è il testo dell'alt](https://it.seaicons.com/wp-content/uploads/2015/06/Baby-Baby-Bottle-icon.png 'Questo è un title')

[biberon]: https://it.seaicons.com/wp-content/uploads/2015/06/Baby-Baby-Bottle-icon.png 'Questo è un altro title'

![alt per la seconda immagine][biberon]
```

![Questo è il testo dell'alt](https://it.seaicons.com/wp-content/uploads/2015/06/Baby-Baby-Bottle-icon.png 'Questo è un title')

[biberon]: https://it.seaicons.com/wp-content/uploads/2015/06/Baby-Baby-Bottle-icon.png 'Questo è un altro title'

![alt per la seconda immagine][biberon]

---

## Link

Gli url vengono riconosciuti da Markdown.
Se volessimo inserire un link all'interno di un testo specifico, possiamo farlo con la seguente sintassi:

```markdown
[testo del link](https://wikipedia.it 'Vai su wikipedia')
```

[testo del link](https://wikipedia.it 'Vai su wikipedia')

---

## Tables

Per le tabelle possiamo separare header e colonne col pipe (`|`). Tra gli headers e le colonne principali dobbiamo inserire una fila di `---` separati da pipe per ogni colonna:

```markdown
| Taglia | Colore | Marca   |
| ------ | ------ | ------- |
| S      | Giallo | Adidas  |
| M      | Giallo | Adidas  |
| L      | Giallo | Adidas  |
| XL     | Blu    | Diadora |
```

| Taglia | Colore | Marca   |
| ------ | ------ | ------- |
| S      | Giallo | Adidas  |
| M      | Giallo | Adidas  |
| L      | Giallo | Adidas  |
| XL     | Blu    | Diadora |

---

## Code snippets

I code snipetts possono essere inseiriti inline o come blocco.

Per del codice inline basta inserire una o più parole tra backtick:

```markdown
La root dell'applicazione è nel file `App.js` nella carttella `src`
```

La root dell'applicazione è nel file `App.js` nella carttella `src`

Per del codice in blocco possiamo utilizzare 3 backtick. E' anche possibile specificare il linguaggio del blocco per una sintassi correttamente evidenziata

```html
<div class="scrollmenu">
  <a href="#home">Home</a>
  <a href="#news">News</a>
  <a href="#contact">Contact</a>
  <a href="#about">About</a>
  ...
</div>
```


```javascript
var x = 10;
x -= 5;
```
