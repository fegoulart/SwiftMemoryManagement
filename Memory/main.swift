import Foundation

class MyClass {
    var value: String

    init(_ value: String) {
        self.value = value
    }
}

do {
    let object1 = MyClass("my value")
    let object1Memory = MemoryAddress<MyClass>(of: object1)
    let object1ValueMemory = MemoryAddress(of: &object1.value)
    print("Debug - Object1 Memory Address: ", object1Memory.description)
    print("Debug - Object1 Value Memory Address", object1ValueMemory.description)

    if let stringPointer:UnsafeMutablePointer = UnsafeMutablePointer<String>(bitPattern: object1ValueMemory.intValue) {
        stringPointer.pointee = "another value"
        print(object1.value) // Expected: another value
        stringPointer.deinitialize(count: 1)
    }
}
struct MemoryAddress<T>: CustomStringConvertible {

    let intValue: Int

    var description: String {
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", intValue)
    }

    // for structures
    init(of structPointer: UnsafePointer<T>) {
        intValue = Int(bitPattern: structPointer)
    }
}

extension MemoryAddress where T: AnyObject {

    // for classes
    init(of classInstance: T) {
        intValue = Int(bitPattern: Unmanaged<T>.passUnretained(classInstance).toOpaque())
    }
}
