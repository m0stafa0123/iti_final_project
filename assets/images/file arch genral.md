lib/
├── main.dart                          # نقطة البداية للتطبيق
├── app.dart                           # الـ MaterialApp والتوجيهات (routing)
│
├── core/                              # أشياء ثابتة ومش متغيرة
│   ├── constants/                     # ألوان، حجم الخط، strings ثابتة
│   │   ├── colors.dart
│   │   ├── app_strings.dart
│   └── theme/                         # الثيم العام للتطبيق
│       └── app_theme.dart
│
├── models/                            # موديلات البيانات (Note model)
│   └── note_model.dart
│
├── services/                          # الخدمات (مثل shared prefs أو DB)
│   └── note_service.dart
│
├── features/                          # كل ميزة بملفاتها
│   └── notes/
│       ├── data/                      # المصادر: قراءة وكتابة البيانات
│       │   └── notes_repository.dart
│       ├── logic/                     # BLoC أو Cubit لو هتستخدمه
│       │   └── notes_cubit.dart
│       └── presentation/             # UI الخاص بالـ notes
│           ├── screens/
│           │   ├── notes_list_screen.dart
│           │   └── add_note_screen.dart
│           └── widgets/
│               ├── note_item.dart
│               └── note_form.dart


assets/
├── images/
│   └── empty_notes.png
├── fonts/
│   └── Cairo-Regular.ttf
