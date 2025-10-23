# ProtDSL

![Status: Archived](https://img.shields.io/badge/Status-Archived-lightgrey)
![Educational Project](https://img.shields.io/badge/Type-Educational%20Sandbox-blue)
![DSL Research](https://img.shields.io/badge/Focus-ISA%20DSL%20Prototype-orange)

**ProtDSL** is an educational sandbox project focused on creating a Domain-Specific Language (DSL) for describing Instruction Set Architecture (ISA) specifications. This prototype demonstrates a Ruby-based DSL for defining computer architectures.

> **📝 Note: This repository is archived**
>
> The code represents a minimal prototype and is preserved for educational purposes.

## 🏗️ Project Structure

```bash
ProtDSL/
├── Generic/                # Base constructs and core DSL infrastructure
│   ├── base.rb             # Fundamental base classes and utilities
│   ├── builder.rb          # DSL builder pattern implementation
│   ├── scope.rb            # Scope management for symbol resolution
│   └── var.rb              # Variable and operand definitions
├── Target/                 # Target architecture implementations
│   └── RISC-V/             # RISC-V architecture support
│       ├── 32I.rb          # RV32I base instruction set definition
│       ├── encoding.rb     # Instruction encoding schemes
│       └── regfile.rb      # Register file configuration
└── main.rb                 # Main entry point and examples
```

## 🎯 Project Scope

This prototype implements a minimal DSL for ISA description with:

- **Core DSL Framework** (`Generic/`): Reusable components for building architecture descriptions
- **RISC-V RV32I Target** (`Target/RISC-V/`): Partial implementation supporting only two instructions (ADD, SUB)

## 🛠️ Implementation Details

### Core Components

- **`Generic/base.rb`**: Foundation classes for the DSL
- **`Generic/builder.rb`**: Builder pattern for fluent DSL syntax
- **`Generic/scope.rb`**: Symbol table and scope management
- **`Generic/var.rb`**: Operand and variable definitions

### RISC-V Implementation

- **`Target/RISC-V/32I.rb`**: RV32I instruction set definitions
- **`Target/RISC-V/encoding.rb`**: Instruction encoding patterns
- **`Target/RISC-V/regfile.rb`**: Register file specification

### Supported Instructions
- `ADD` - Integer addition
- `SUB` - Integer subtraction

## 🚀 Getting Started

*Note: This is a prototype for educational purposes only.*

To explore the codebase:

```bash
git clone https://github.com/ProteusLab/ProtDSL.git
cd ProtDSL

ruby main.rb
```

### Example Usage

The DSL allows defining instructions in a structured format:

```ruby
Instruction(:ADD, XReg(:rd), XReg(:rs1), XReg(:rs2)) {
    encoding *format_r_alu(:add, rd, rs1, rs2)
    asm { "ADD #{rd}, #{rs1}, #{rs2}" }
    code { rd[]= rs1 + rs2 }
}
```

## 📚 Educational Value

This sandbox project demonstrates:

- **DSL Design Patterns**: Builder pattern, fluent interfaces
- **Computer Architecture**: Instruction encoding, register files, ISA specification
- **Ruby Metaprogramming**: Dynamic class creation, method_missing, DSL implementation techniques

## 🔬 Limitations

As an educational prototype:

- Only supports 2 RISC-V instructions (ADD, SUB)
- RV32I implementation is incomplete
- No code generation or simulation capabilities
- Minimal error handling and validation

## 🤝 Contributing

This repository is archived and not accepting contributions. It remains public as a reference for educational purposes.

## 📄 License

This educational project is provided under the [Apache License 2.0](LICENSE).

---

**Educational Purpose**: This prototype demonstrates DSL design concepts for computer architecture description. The implementation is minimal and intended for learning rather than production use.
