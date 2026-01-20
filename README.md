# Edutime – Student-First Lecture Scheduling App

<div align="center">

![Edutime Logo](assets/images/logo.png)

**No more lecture clashes, venue confusion or WhatsApp chaos at Chuka University**

[![Flutter](https://img.shields.io/badge/Flutter-3.24+-02569B?logo=flutter&logoColor=white)](https://flutter.dev)
[![Dart](https://img.shields.io/badge/Dart-3.5+-0175C2?logo=dart&logoColor=white)](https://dart.dev)
[![Supabase](https://img.shields.io/badge/Supabase-Realtime-3ECF8E?logo=supabase&logoColor=white)](https://supabase.com)
[![License: MIT](https://img.shields.io/badge/License-MIT-yellow.svg)](LICENSE)

</div>

Edutime empowers **students**, **class representatives** and **faculty reps** to coordinate lectures in real time while automatically preventing conflicts.

---

## ✨ Features

### Students
- Calendar + list view of your lectures
- Instant push notifications on changes
- Venue availability checker
- Light/dark mode & 12/24h format
- Works offline (cached data)

### Class Representatives
- Create / edit / cancel one-time or recurring lectures
- Invite other cohorts for combined classes
- Real-time conflict detection (venue + cohort)
- Manage semester courses & basic cohort info

### Faculty / Department Reps
- Promote students → class reps
- Create & manage cohort subgroups (e.g. bi-semester)
- Faculty-wide visibility of schedules

---

## 🛠 Tech Stack

- **Frontend**: Flutter  •  Dart  •  flutter_bloc + BLoC pattern  •  Clean Architecture
- **Backend**: Supabase (PostgreSQL + Realtime + Auth)
- **Notifications**: Firebase Cloud Messaging
- **API Layer**: Vercel serverless functions (optional)
- **Offline**: Hive + flutter_secure_storage
- **Others**: table_calendar, dio, get_it + injectable, freezed, dartz

---

## 🚀 Quick Start

```bash
# 1. Clone & enter folder
git clone https://github.com/your-org/edutime.git
cd edutime

# 2. Install dependencies
flutter pub get

# 3. Create .env in root (or use --dart-define for CI)
SUPABASE_URL=https://xxxx.supabase.co
SUPABASE_ANON_KEY=your-anon-key
# Optional: API_BASE_URL=...

# 4. Add Firebase config files
#   → android/app/google-services.json
#   → ios/Runner/GoogleService-Info.plist

# 5. Generate freezed & injectable files
dart run build_runner build --delete-conflicting-outputs

# 6. Run (pick device)
flutter run