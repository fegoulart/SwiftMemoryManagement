//
//  MyStruct.swift
//  Memory
//
//  Created by Fernando Luiz Goulart on 07/06/22.
//

import Foundation

do {

    // 2 classes

    let object1 = MyClass("value")
    let object1Memory = MemoryAddress<MyClass>(of: object1)
    let object1ValueMemory = MemoryAddress(of: &object1.value)
    print("Debug - Object1 Memory Address:", object1Memory.description)
    print("Debug - Object1 Value Memory Address:", object1ValueMemory.description)
    let object2 = object1
    let object2Memory = MemoryAddress<MyClass>(of: object2)
    let object2ValueMemory = MemoryAddress(of: &object2.value)
    print("Debug - Object2 Memory Address:", object2Memory.description)
    print("Debug - Object2 Value Memory Address:", object2ValueMemory.description)

    // 2 structs

    var struct1 = MyStruct("value")
    let struct1Memory = MemoryAddress(of: &struct1)
    let struct1ValueMemory = MemoryAddress(of: &struct1.value)
    print("Debug - Struct1 Memory Address:", struct1Memory.description)
    print("Debug - Struct1 Value Memory Address", struct1ValueMemory.description) // Classes need 16 bytes metadata for swift management
    var struct2 = struct1
    let struct2Memory = MemoryAddress(of: &struct2)
    let struct2ValueMemory = MemoryAddress(of: &struct2.value)
    print("Debug - Struct2 Memory Address:", struct2Memory.description)
    print("Debug - Struct2 Value Memory Address:", struct2ValueMemory.description)

    // Changing object1Value
    if let object1ValueMemoryAddress = object1ValueMemory.intValue, let object1ValuePointer:UnsafeMutablePointer = UnsafeMutablePointer<String>(bitPattern: object1ValueMemoryAddress) {
        object1ValuePointer.pointee = "another value"

        print("Debug - Object1Value:", object1.value)
        print("Debug - Object2Value:", object2.value)

        defer {
            object1ValuePointer.deinitialize(count: 1)
        }

        // Changing struct1Value
        if let struct1ValueMemoryAddress = struct1ValueMemory.intValue, let struct1ValuePointer:UnsafeMutablePointer = UnsafeMutablePointer<String>(bitPattern: struct1ValueMemoryAddress) {
            struct1ValuePointer.pointee = "another value"

            print("Debug - Struct1Value", struct1.value)
            print("Debug - Struct2Value", struct2.value)

            struct1ValuePointer.deinitialize(count: 1)
        }
    }
}
