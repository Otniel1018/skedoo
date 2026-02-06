class Jadwal {
  String title;
  String date;
  String category;
  int priority;
  bool isDone;

  Jadwal(this.title, this.date, this.category, this.priority, this.isDone);

  void markAsDone(bool value) {
    isDone = value;
  }

  String getPriorityLabel() {
    switch (priority) {
      case 1:
        return '⚪ Super Low';
      case 2:
        return '🟢 Low';
      case 3:
        return '🟡 Medium';
      case 4:
        return '🟠 Important';
      case 5:
        return '🔴 Very Important';
      default:
        return 'Not a Priority';
    }
  }

  String getStatusLabel() {
    return isDone ? '✅ Selesai' : '⌛ Belum selesai';
  }
}
