//
//  MemoryAddress.swift
//  Memory
//
//  Created by Fernando Luiz Goulart on 07/06/22.
//

struct MemoryAddress<T>: CustomStringConvertible {

    var intValue: Int?

    var description: String {
        guard let address = intValue else { return "" }
        let length = 2 + 2 * MemoryLayout<UnsafeRawPointer>.size
        return String(format: "%0\(length)p", address)
    }

    // for structures
    init(of structPointer: inout T) {
        withUnsafePointer(to: &structPointer) { pointer in
            intValue = Int(bitPattern: pointer)
        }
    }
}

extension MemoryAddress where T: AnyObject {

    // for classes
    init(of classInstance: T) {
        intValue = Int(bitPattern: Unmanaged<T>.passUnretained(classInstance).toOpaque())
    }
}
