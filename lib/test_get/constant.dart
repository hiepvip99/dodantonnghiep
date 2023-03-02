const domainName = 'http://172.168.10.29:3000';

// lệnh chạy trên web
// flutter run -d edge --web-browser-flag "--disable-web-security"

extension StringExtension on String {
  String capitalize() {
    return "${this[0].toUpperCase()}${this.substring(1).toLowerCase()}";
  }
}
