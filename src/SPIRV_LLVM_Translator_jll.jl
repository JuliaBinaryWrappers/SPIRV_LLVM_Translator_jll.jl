# Use baremodule to shave off a few KB from the serialized `.ji` file
baremodule SPIRV_LLVM_Translator_jll
using Base
using Base: UUID
import JLLWrappers

JLLWrappers.@generate_main_file_header("SPIRV_LLVM_Translator")
JLLWrappers.@generate_main_file("SPIRV_LLVM_Translator", UUID("4a5d46fc-d8cf-5151-a261-86b458210efb"))
end  # module SPIRV_LLVM_Translator_jll
