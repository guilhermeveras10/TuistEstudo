
public enum ActionIdentifier: String, CaseIterable {
    /// anime
    case actionAnime = "action-anime"
}

extension ActionIdentifier: Identifiable {
    public var id: String { rawValue }
}
