# InvestSuite - Financial Portfolio Overview

📹 **Demo video** showing how to run the server before launching the app, and demonstrating the app's features and available options.
https://drive.google.com/file/d/1c1yQl73IPUh2Uv5eCrAJb-l74TiqgTfV/view?usp=sharing

---

## 📝 Implementation Notes

It wasn't clear whether I needed to use a mock or a real server, so I went with a "real" one. Since there's no free gRPC server available, I built my own gRPC server in Dart that calls a free API. In a production environment, the app would call the company's actual gRPC server directly.

I also created a mock for the tests and another mock for the portfolio's historical data. Accessing historical data through the API requires a paid plan, and I didn't want to complicate the setup by integrating another provider. Because of that, I generated the historical data based on the daily price changes.

Updating the assets can take up to 20 seconds due to market updates and the free API rate limits. That's why I included only four assets.

The portfolio updates using real market values from the API.

I didn't add the `.env` file to `.gitignore`, so you won't need to manually enter the free API key.

---

## 🚀 Getting Started

### 1. Start the gRPC Server

```bash
cd server
dart pub get
dart run bin/server.dart
```

### 2. Run the Flutter App

```bash
flutter pub get
flutter run
```

## 🧪 Testing

```bash
# Run all tests
flutter test

# Run with coverage
flutter test --coverage
```

## 📂 Project Structure

```
lib/
├── core/
│   ├── theme/           # Retail Bank & Neobank themes
│   └── utils/           # Formatters & date utilities
├── features/
│   ├── home/            # Home screen with bottom navigation
│   ├── portfolio/
│   │   ├── data/        # gRPC client, repository, mappers & proto-generated code
│   │   ├── domain/      # Freezed models (asset, portfolio, candle, performance)
│   │   └── presentation/# Screens, controllers & widgets
│   └── settings/        # Theme settings screen
├── router/              # AutoRoute navigation
├── widgets/             # Shared UI components
└── main.dart

server/
├── bin/server.dart      # gRPC server entry point
├── protos/              # Protocol buffer definitions
│   └── portfolio.proto
└── lib/
    ├── generated/                  # Proto-generated code
    ├── portfolio_config.dart       # Server configuration
    └── portfolio_service_impl.dart # Finnhub API integration

test/
├── helpers/             # Test utilities & mocks
├── unit/                # Unit tests (models, controllers)
└── widget/              # Widget tests
```

## 📊 Architecture

```
┌─────────────┐    REST    ┌─────────────┐    gRPC    ┌─────────────┐
│ Finnhub API │ ─────────▶ │ Dart Server │ ─────────▶ │ Flutter App │
└─────────────┘            └─────────────┘            └─────────────┘
```

The server fetches real-time stock/crypto prices from Finnhub and serves them via gRPC to the Flutter client.
