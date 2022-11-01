class ApplicationConstats {
  ApplicationConstats._init();
  static final ApplicationConstats _instance = ApplicationConstats._init();
  static ApplicationConstats get instance => _instance;

  final String dummyImage = 'https://picsum.photos/200/300';
  final String appName = 'Bloc Example';
}
