import WebKit

// MARK: - YouTubePlayer+ConfigureWebViewAction

public extension YouTubePlayer {

    /// An action that adjusts the web view configuration before the player's web view is created,
    /// for example to add user scripts or script message handlers.
    struct ConfigureWebViewAction: Sendable {

        // MARK: Typealias

        /// The handler.
        public typealias Handler = @MainActor (WKWebViewConfiguration) -> Void

        // MARK: Properties

        /// The handler.
        private let handler: Handler

        // MARK: Initializer

        /// Creates a new instance of ``YouTubePlayer/ConfigureWebViewAction``
        /// - Parameter handler: The handler.
        public init(
            handler: @escaping Handler
        ) {
            self.handler = handler
        }

    }

}

// MARK: - Call as Function

public extension YouTubePlayer.ConfigureWebViewAction {

    /// Call ``YouTubePlayer/ConfigureWebViewAction`` as function.
    /// - Parameter configuration: The web view configuration to adjust.
    @MainActor
    func callAsFunction(
        _ configuration: WKWebViewConfiguration
    ) {
        self.handler(configuration)
    }

}

// MARK: - Equatable

extension YouTubePlayer.ConfigureWebViewAction: Equatable {

    /// Returns a Boolean value indicating whether two values are equal.
    /// - Parameters:
    ///   - lhs: A value to compare.
    ///   - rhs: Another value to compare.
    public static func == (
        lhs: Self,
        rhs: Self
    ) -> Bool {
        true
    }

}

// MARK: - Hashable

extension YouTubePlayer.ConfigureWebViewAction: Hashable {

    /// Hashes the essential components of this value by feeding them into the given hasher.
    /// - Parameter hasher: The hasher to use when combining the components of this instance.
    public func hash(
        into hasher: inout Hasher
    ) {}

}

// MARK: - Default

public extension YouTubePlayer.ConfigureWebViewAction {

    /// Leaves the configuration as it is.
    static let `default` = Self { _ in }

}
