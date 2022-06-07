# SWIFT MEMORY MANAGEMENT

## Goal

Show memory allocation differences between reference and value types

## Understanding results

* There are 16 bytes between object initial memory and first value memory address
* Structs are value types (if we copy a struct it will allocate another memory slot)

> Debug - Object1 Memory Address: 0x00000001052a2790
> 
> Debug - Object1 Value Memory Address: 0x00000001052a27a0
> 
> Debug - Object2 Memory Address: 0x00000001052a2790
> 
> Debug - Object2 Value Memory Address: 0x00000001052a27a0
> 
> Debug - Struct1 Memory Address: 0x000000016fdff1e0
> 
> Debug - Struct1 Value Memory Address 0x000000016fdff1e0
> 
> Debug - Struct2 Memory Address: 0x000000016fdff1b0
> 
> Debug - Struct2 Value Memory Address: 0x000000016fdff1b0
> 
> Debug - Object1Value: another value
> 
> Debug - Object2Value: another value
> 
> Debug - Struct1Value another value
> 
> Debug - Struct2Value value