# Autogenerated wrapper script for SPIRV_LLVM_Translator_jll for aarch64-linux-gnu-cxx03
export libLLVMSPIRV, llvm_spirv

JLLWrappers.@generate_wrapper_header("SPIRV_LLVM_Translator")
JLLWrappers.@declare_library_product(libLLVMSPIRV, "libLLVMSPIRVLib.so.16jl")
JLLWrappers.@declare_executable_product(llvm_spirv)
function __init__()
    JLLWrappers.@generate_init_header()
    JLLWrappers.@init_library_product(
        libLLVMSPIRV,
        "lib/libLLVMSPIRVLib.so",
        RTLD_LAZY | RTLD_DEEPBIND,
    )

    JLLWrappers.@init_executable_product(
        llvm_spirv,
        "bin/llvm-spirv",
    )

    JLLWrappers.@generate_init_footer()
end  # __init__()
