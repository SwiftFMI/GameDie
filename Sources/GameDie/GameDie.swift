public enum DieCreationError: Error, CustomStringConvertible {
    case insufficientNumberOfFaces
    case oddNumberOfFaces
    case tooManyFaces
    
    public var description: String {
        switch self {
        case .insufficientNumberOfFaces:
            return "A die should have at least 4 faces"
        case .oddNumberOfFaces:
            return "A die should have an event number of faces (multiple of 2)"
        case .tooManyFaces:
            return "A die should have at most 120 faces to be physically possible"
        }
    }
}

public struct Die<T: CustomStringConvertible> {
    public let faces: [T]
    
    public  init(faces: [T]) throws {
        guard faces.count > 3 else { throw DieCreationError.insufficientNumberOfFaces }
        guard faces.count.isMultiple(of: 2) else { throw DieCreationError.oddNumberOfFaces }
        guard faces.count <= 120 else { throw DieCreationError.tooManyFaces }
        
        self.faces = faces
    }
}

public extension Die {
    func roll() -> T { return faces.shuffled()[0] }
}
