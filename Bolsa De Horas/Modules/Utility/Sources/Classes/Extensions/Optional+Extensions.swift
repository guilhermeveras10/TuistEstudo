extension Optional where Wrapped == String {
    public var orEmpty: String {
        self ?? ""
    }
}

extension Optional where Wrapped == Double {
    public var orZero: Double {
        self ?? 0
    }
}

extension Optional where Wrapped == Int {
    public var orZero: Int {
        self ?? 0
    }
}

extension Optional where Wrapped == Bool {
    public var orFalse: Bool {
        self ?? false
    }
}

extension Optional where Wrapped == Bool {
    public var orTrue: Bool {
        self ?? true
    }
}

extension Optional where Wrapped: RawRepresentable, Wrapped.RawValue == String {
    public var orEmpty: String {
        self?.rawValue ?? ""
    }
}
