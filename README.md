<div align="center">

<img src="assets/brand/milaak_logo_light.png" alt="Milaak Logo" width="220"/>

# مِلاك — Milaak

### تطبيق إدارة العقارات المحلي | Local-First Property Management App

[![Flutter](https://img.shields.io/badge/Flutter-3.x-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.x-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Platform](https://img.shields.io/badge/Platform-Android%20%7C%20iOS-green)](https://flutter.dev)
[![License](https://img.shields.io/badge/License-MIT-yellow)](LICENSE)
[![Arabic RTL](https://img.shields.io/badge/Language-Arabic%20RTL-red)](https://en.wikipedia.org/wiki/Right-to-left)

</div>

---

## 🇸🇦 عن التطبيق

**مِلاك** هو تطبيق جوال عربي لإدارة العقارات والمستأجرين مصمم للعمل **محلياً بالكامل** بدون اتصال إنترنت. يستهدف أصحاب العقارات والمكاتب العقارية الصغيرة في المنطقة العربية.

### ✨ الميزات الرئيسية

| الميزة | الوصف |
|--------|--------|
| 🏢 **إدارة العقارات** | إضافة وإدارة الوحدات والعقارات |
| 👥 **إدارة المستأجرين** | ملفات المستأجرين والتواصل معهم |
| 📄 **العقود** | إنشاء ومتابعة عقود الإيجار |
| 💰 **التحصيل المالي** | تسجيل المدفوعات وسندات القبض |
| 📊 **التقارير** | رسوم بيانية وتقارير مالية |
| 🔔 **التنبيهات** | تذكير بمواعيد الإيجار والتجديد |
| 📑 **تصدير PDF** | طباعة العقود وسندات القبض |
| 🔒 **القفل المحلي** | حماية التطبيق ببصمة الإصبع أو PIN |
| 💾 **النسخ الاحتياطي** | تصدير واستيراد قاعدة البيانات محلياً |

---

## 🌐 About

**Milaak** is an Arabic-first, **local-first** mobile app for property management. No internet connection required for core functionality. No login, no cloud sync — all data stays on your device using SQLite.

Built for small property offices and individual landlords in the Arab world.

---

## 🛠️ Technology Stack

```
Flutter 3.x / Dart 3.x
├── State Management  → flutter_riverpod
├── Navigation        → go_router
├── Local Database    → Drift (SQLite)
├── UI Framework      → Material 3 (RTL Arabic)
├── Fonts             → Tajawal + Noto Naskh Arabic
├── PDF Generation    → pdf + printing
├── Charts            → fl_chart
├── Notifications     → flutter_local_notifications
├── Auth              → local_auth (biometrics/PIN)
├── Secure Storage    → flutter_secure_storage
└── File Operations   → file_picker + share_plus + path_provider
```

---

## 📁 Project Structure

```
lib/
├── main.dart                    # Entry point
├── app/
│   ├── milaak_app.dart          # App root widget
│   ├── theme.dart               # Material 3 theme (light/dark)
│   ├── app_router.dart          # go_router setup
│   ├── app_shell.dart           # Bottom nav shell
│   └── startup_gate.dart        # First-launch setup gate
├── core/
│   ├── formatters.dart          # Date & currency formatters
│   └── labels.dart              # Arabic UI strings
├── data/
│   ├── local/
│   │   ├── app_database.dart    # Drift DB schema & DAOs
│   │   └── app_database.g.dart  # Generated code
│   └── repositories/
│       └── rental_repositories.dart  # Business logic layer
├── features/
│   ├── dashboard/               # Home dashboard
│   ├── properties/              # Properties management
│   ├── tenants/                 # Tenants management
│   ├── contracts/               # Contracts management
│   ├── payments/                # Payments & receipts
│   ├── reports/                 # Reports & charts
│   └── settings/                # Settings & backup
├── services/
│   ├── pdf_service.dart         # PDF generation
│   ├── notification_service.dart
│   ├── message_service.dart     # SMS/WhatsApp sharing
│   └── lock_service.dart        # Biometric lock
└── shared/
    └── widgets/                 # Reusable UI components
```

---

## 🗄️ Database Schema

The local SQLite database (via Drift) contains the following tables:

- `properties` — العقارات والوحدات
- `tenants` — المستأجرون
- `contracts` — عقود الإيجار
- `payments` — سندات القبض والمدفوعات
- `settings` — إعدادات التطبيق
- `audit_logs` — سجل العمليات

---

## 🚀 Getting Started

### Prerequisites

- [Flutter SDK](https://flutter.dev/docs/get-started/install) ≥ 3.8.1
- Dart SDK ≥ 3.x
- Android Studio or Xcode (for device deployment)

### Installation

```bash
# Clone the repository
git clone https://github.com/YOUR_USERNAME/milaak_flutter.git
cd milaak_flutter

# Install dependencies
flutter pub get

# Run the app
flutter run
```

> **Note**: The generated file `lib/data/local/app_database.g.dart` is committed to the repository so you don't need to run `build_runner` on first clone.

### Regenerating Database Code (if you modify the schema)

```bash
dart run build_runner build --delete-conflicting-outputs
```

---

## 📱 Screenshots

> *Coming soon — تضاف قريباً*

---

## 🤝 Contributing

Contributions are welcome! Please open an issue first to discuss what you'd like to change.

---

## 📄 License

This project is licensed under the MIT License — see the [LICENSE](LICENSE) file for details.

---

<div align="center">

Made with ❤️ for the Arab world | صُنع بحب للعالم العربي

</div>
