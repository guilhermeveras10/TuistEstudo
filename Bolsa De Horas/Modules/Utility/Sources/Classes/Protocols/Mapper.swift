public protocol Mapper {
    associatedtype Input
    associatedtype Output

    static func map(input: Input?) -> Output
}
