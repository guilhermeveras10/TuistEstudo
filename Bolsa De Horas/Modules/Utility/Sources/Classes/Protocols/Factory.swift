public protocol Factory {
    associatedtype Output

    func create() -> Output
}
