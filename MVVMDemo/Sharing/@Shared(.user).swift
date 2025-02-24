import Sharing

extension SharedReaderKey where Self == FileStorageKey<ApiClient.User?>.Default {
  static var user: Self {
      Self[.fileStorage(.shared("user")), default: .none]
  }
}
