import Sharing

extension SharedReaderKey where Self == FileStorageKey<ApiClient.User?>.Default {
  static var user: Self {
      Self[.fileStorage(.shared("user")), default: .none]
  }
}

extension SharedReaderKey where Self == FileStorageKey<ApiClient.SignUp?>.Default {
  static var signup: Self {
      Self[.fileStorage(.shared("signup")), default: .none]
  }
}
