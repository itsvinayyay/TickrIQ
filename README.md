# Ticker Insights 📈

Ticker Insights is a Flutter application that lets users input a company ticker, view corresponding earnings metrics in graphical form, and access earnings call transcripts. The app is built with Clean Architecture, leveraging modern Flutter packages for state management, network calls, and responsive UI.

---

## 📱 Screens

<div style="display: flex; gap:40px; justify-content: center;">

<img src="https://drive.google.com/uc?export=view&id=13AC094-gm24hffvb0qLFdF6Cj0wKVwKV"  width="200"/>
<img src="https://drive.google.com/uc?export=view&id=1BbqSCwYpaJRwOF8OCPRmHUMCKDdknbu2"  width="200"/>

<img src="https://drive.google.com/uc?export=view&id=1RgjCUgIYFz3PHdJzRG4GyWFoDfB0Dltr"  width="200"/>

</div>

1. **Ticker Input Screen** – Allows the user to enter a company ticker (e.g., MSFT) to fetch the data.
2. **Graph and Metrics Screen** – Displays a graph showing earnings metrics and a summary of key performance metrics.
3. **Call Transcript Screen** – Shows the earnings call transcript, giving insights into quarterly reports.

---

## 🛠 Architecture and Patterns

- **Clean Architecture**: This project follows Clean Architecture principles to ensure a scalable, maintainable, and testable codebase.
- **Observer Design Pattern**: Enables the app to reactively update data and UI components.
- **Repository Pattern**: Separates data handling, making it easier to manage data from multiple sources (e.g., API).
- **Dependency Injection**: Used for easy injection of services and repositories, ensuring a modular structure.

---

## 🔑 Security

- **Environment Variables**: Sensitive information (API keys, endpoints) is stored in a `.env` file, keeping it secure and separated from the codebase.

---

## 📦 Packages Used

Here are the primary packages used in the project:

```yaml
dependencies:
  cupertino_icons: ^1.0.8
  fl_chart: ^0.69.0
  flutter_screenutil: ^5.9.3
  flutter_animate: ^4.5.0
  dio: ^5.7.0
  flutter_bloc: ^8.1.6
  flutter_dotenv: ^5.2.1
  pretty_dio_logger: ^1.4.0
  flutter_svg: ^2.0.10+1
  flutter_spinkit: ^5.2.1
```
- **State Management (Cubit)**: Uses `flutter_bloc` and Cubits for managing state effectively in a scalable way, following industry standards.
- **Dio**: Handles network requests with a simple and powerful API integration, also supporting logging via `pretty_dio_logger`.
- **fl_chart**: Renders beautiful, customizable graphs to visualize the data.
- **flutter_animate**: Provides smooth animations for enhancing user experience.
- **flutter_dotenv**: Used for loading environment variables securely.

---

## 🚀 How It Works
1. The user enters a ticker on the **Ticker Input Screen**.
2. The app fetches earnings data using Dio and displays graphs and metrics on the **Graph and Metrics Screen**.
3. A call transcript can be viewed, presenting the quarterly report details in the **Call Transcript Screen**.

---

## 🎥 Links

- **Demo Video**: https://drive.google.com/file/d/1PXl-vDEJE9qc_SyK2sBZJ3I2i-RI6XK9/view?usp=sharing
- **APK Download**: https://drive.google.com/file/d/1MoXqeLu84nN1izn3icN51tLdmOpgtfQz/view?usp=sharing

---

## 📝 Code Documentation

All major functions and classes are well-documented, ensuring readability and ease of understanding for contributors.

---

## 📋 Focus Areas

### 1. **Code Quality**
   - Consistent coding style with meaningful comments and well-organized classes.
   - Comprehensive use of Flutter's type safety and null safety.

### 2. **Architecture**
   - Clean Architecture structure that enhances code separation and testability.
   - Observer Design and Repository Pattern to support scalability.

### 3. **State Management**
   - Cubits are used for efficient and modular state management, aligning with best practices in Flutter development.

### 4. **Network Operations and API Integration**
   - Uses Dio for structured network calls and response handling.
## 🚀 Getting Started

To clone and run this application, follow these steps:

1. **Clone the Repository**:
   ```bash
   git clone https://github.com/your-repo-url/your-project-name.git
   cd your-project-name
   ```
2. **Install Dependencies**
```bash
flutter pub get
```
3. **Configure Environment Variables**:

- Add an `.env` file at the root level to secure API keys and configurations.
- Refer to the [flutter_dotenv documentation](https://pub.dev/packages/flutter_dotenv) for usage details.
4. **Run the Application**
```bash
flutter run
```
## 🎉 Conclusion
This project combines modern Flutter features and best practices to deliver a smooth, data-driven experience for exploring earnings data. With structured architecture, a solid state management approach, and rich UI animations, the app provides a practical foundation for any advanced Flutter application development.


