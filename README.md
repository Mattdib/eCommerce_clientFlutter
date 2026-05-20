# - eCommerce Client — Flutter

Applicazione mobile/multipiattaforma sviluppata con **Flutter** che funge da client per il backend [eCommerce_WebServerSpring](https://github.com/Mattdib/eCommerce_WebServerSpring). Permette di sfogliare il catalogo prodotti, effettuare ricerche avanzate, gestire il carrello e completare acquisti tramite chiamate REST.

***

## - Tecnologie

| Dipendenza | Versione | Utilizzo |
|---|---|---|
| Flutter / Dart SDK | `>=3.4.3 <4.0.0` | Framework UI multipiattaforma |
| `provider` | `^6.1.2` | State management |
| `http` | `^1.0.0` | Chiamate REST al backend |
| `dio` | `^5.5.0+1` | Client HTTP avanzato |
| `google_fonts` | — | Tipografia personalizzata |
| `google_nav_bar` | `^5.0.6` | Navigazione bottom bar |
| `cupertino_icons` | `^1.0.6` | Icone stile iOS |

***

## 📁 Struttura del progetto

```
lib/
├── main.dart               # Entry point e routing dell'app
├── pages/                  # Schermate dell'applicazione
│   ├── homePage.dart
│   ├── shopPage.dart
│   ├── searchPage.dart
│   ├── advancedSearchPage.dart
│   ├── productDetailsPage.dart
│   ├── cartPage.dart
│   ├── purchasePage.dart
│   └── resultPage.dart
├── models/                 # Logica e modelli dati
│   ├── Product.dart
│   ├── cartList.dart
│   ├── productInCart.dart
│   ├── formInfo.dart
│   ├── model.dart
│   └── restManager.dart    # Gestore chiamate REST
├── support/                # Costanti e listener
│   ├── constants.dart
│   └── errorListener.dart
├── components/             # Widget riutilizzabili
└── themes/                 # Temi dell'interfaccia
    └── light_mode.dart
```

***

## - Descrizione delle pagine

| Pagina | Descrizione |
|---|---|
| `HomePage` | Pagina principale dell'app |
| `ShopPage` | Catalogo prodotti con lista paginata |
| `SearchPage` | Ricerca prodotti per nome |
| `AdvancedSearchPage` | Ricerca avanzata (nome, descrizione, prezzo, tipo) |
| `ProductDetailsPage` | Dettaglio di un prodotto |
| `CartPage` | Carrello con i prodotti selezionati |
| `PurchasePage` | Conferma e invio dell'ordine |
| `ResultPage` | Esito dell'acquisto |

***

## - Connessione al backend

L'app comunica con il backend Spring Boot tramite la classe `RestManager`, che gestisce le chiamate HTTP (GET, POST, PUT, DELETE) in JSON. Il server di destinazione è configurato in `lib/support/constants.dart`:

```dart
static final String ADDRESS_STORE_SERVER = "localhost:8080";
```

> ⚠️ Per testare su dispositivo fisico o emulatore Android, sostituire `localhost` con l'IP della macchina che esegue il backend (es. `192.168.1.x:8080`).

***

## - Installazione e avvio del progetto

**Prerequisiti:** Flutter SDK installato, backend [eCommerce_WebServerSpring](https://github.com/Mattdib/eCommerce_WebServerSpring) in esecuzione su `localhost:8080`.

```bash
# Clona la repository
git clone https://github.com/Mattdib/eCommerce_clientFlutter.git
cd eCommerce_clientFlutter

# Installa le dipendenze
flutter pub get

# Avvia l'app (emulatore o dispositivo connesso)
flutter run
```

***

## 🗂️ Progetto correlato

Il backend REST che alimenta questa app è disponibile nella repository: [eCommerce_WebServerSpring](https://github.com/Mattdib/eCommerce_WebServerSpring)

***

## - Autore

**Mattia** — [@Mattdib](https://github.com/Mattdib)
