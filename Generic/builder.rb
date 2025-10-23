require_relative "scope"

# Basics
module SimInfra
    def assert(condition, msg = nil); raise msg if !condition; end

    @@instructions = []
    InstructionInfo= Struct.new(:name, :fields, :format, :code, :args, :asm)
    class InstructionInfoBuilder
        def initialize(name, *args);
            @info = InstructionInfo.new(name)
            @info.args = args
            @info.asm = nil
            # Make args available as methods in the builder context
            args.each do |arg|
                define_singleton_method(arg.name) { arg }
            end
        end
        def encoding(format, fields); @info.fields = fields; @info.format = format; end

        def asm(&block)
            @info.asm = instance_eval(&block)
        end

        attr_reader :info
    end

    def Instruction(name, *args, &block)
        bldr = InstructionInfoBuilder.new(name, *args)
        bldr.instance_eval &block
        @@instructions << bldr.info
        nil # only for debugging in IRB
    end
end

# * generate precise fields
module SimInfra
    class InstructionInfoBuilder
    include SimInfra
        def code(&block)
            @info.code = scope = Scope.new(nil) # root scope
            @info.args.each do |arg|
                scope.add_var(arg.name, :i32)
                if [:rs1, :rs2].include?(arg.name)
                    scope.stmt(:getreg, [arg.name, arg])
                end
            end

            scope.instance_eval &block

            dst_arg = @info.args.find { |a| a.name == :rd }
            if dst_arg
                scope.stmt(:setreg, [dst_arg, dst_arg.name])
            end
        end
    end
end
