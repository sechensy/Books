# BookTracker

BookTracker — это iOS-приложение для ведения личной библиотеки. Добавляй книги, записывай заметки и сохраняй любимые цитаты. Построено на SwiftUI, Core Data и архитектуре MVVM.


## Скриншоты

| Онбординг | Список книг | Карточка книги | Добавление книги |
|-----------|-------------|----------------|------------------|
| <img width="200" height="505" alt="Снимок экрана 2025-08-06 в 00 34 41" src="https://github.com/user-attachments/assets/6bd8ab71-affa-4ceb-9725-39cdb4ce7a84" /> | <img width="210" height="510" alt="Снимок экрана 2025-08-06 в 00 35 07" src="https://github.com/user-attachments/assets/b83b3721-3095-4059-b6b1-e1334dd236b6" /> | <img width="210" height="510" alt="Снимок экрана 2025-08-06 в 00 35 18" src="https://github.com/user-attachments/assets/a0f8de32-088e-46ca-aed3-7a56e10a08d5" /> | <img width="220" height="520" alt="Снимок экрана 2025-08-06 в 00 37 54" src="https://github.com/user-attachments/assets/6c5a855d-7a45-475b-9113-63119f2c6a4f" /> |

## Стек технологий

- Swift
- SwiftUI
- Core Data
- MVVM
- UserDefaults

## Возможности

- Онбординг при первом запуске
- Список книг с обложками, авторами и описанием
- Добавление новой книги
- Заметки и цитаты по каждой книге
- Локальное хранение через Core Data


## Архитектура

Проект следует **архитектуре MVVM** с разделением на:

- **Model** — объекты Core Data: `Book`, `Note`, `Quotes`
- **ViewModel** — бизнес-логика и состояние UI
- **View** — интерфейс пользователя на SwiftUI
- **Coordinator** — управление навигацией
- **Manager** — работа с Core Data и файловой системой


## TODO

- [ ] Поиск по книгам
- [ ] Редактирование книг
- [ ] Расширенные статусы чтения
- [ ] UI/юнит тесты

