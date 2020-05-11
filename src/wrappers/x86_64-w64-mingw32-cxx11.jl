# Autogenerated wrapper script for SPIRV_LLVM_Translator_jll for x86_64-w64-mingw32-cxx11
export llvm_spirv, libLLVMSPIRV

## Global variables
PATH = ""
LIBPATH = ""
LIBPATH_env = "PATH"
LIBPATH_default = ""

# Relative path to `llvm_spirv`
const llvm_spirv_splitpath = ["bin", "llvm-spirv.exe"]

# This will be filled out by __init__() for all products, as it must be done at runtime
llvm_spirv_path = ""

# llvm_spirv-specific global declaration
function llvm_spirv(f::Function; adjust_PATH::Bool = true, adjust_LIBPATH::Bool = true)
    global PATH, LIBPATH
    env_mapping = Dict{String,String}()
    if adjust_PATH
        if !isempty(get(ENV, "PATH", ""))
            env_mapping["PATH"] = string(PATH, ';', ENV["PATH"])
        else
            env_mapping["PATH"] = PATH
        end
    end
    if adjust_LIBPATH
        LIBPATH_base = get(ENV, LIBPATH_env, expanduser(LIBPATH_default))
        if !isempty(LIBPATH_base)
            env_mapping[LIBPATH_env] = string(LIBPATH, ';', LIBPATH_base)
        else
            env_mapping[LIBPATH_env] = LIBPATH
        end
    end
    withenv(env_mapping...) do
        f(llvm_spirv_path)
    end
end


# Relative path to `libLLVMSPIRV`
const libLLVMSPIRV_splitpath = ["bin", "LLVMSPIRVLib.dll"]

# This will be filled out by __init__() for all products, as it must be done at runtime
libLLVMSPIRV_path = ""

# libLLVMSPIRV-specific global declaration
# This will be filled out by __init__()
libLLVMSPIRV_handle = C_NULL

# This must be `const` so that we can use it with `ccall()`
const libLLVMSPIRV = "LLVMSPIRVLib.dll"


"""
Open all libraries
"""
function __init__()
    global artifact_dir = abspath(artifact"SPIRV_LLVM_Translator")

    # Initialize PATH and LIBPATH environment variable listings
    global PATH_list, LIBPATH_list
    # We first need to add to LIBPATH_list the libraries provided by Julia
    append!(LIBPATH_list, [Sys.BINDIR, joinpath(Sys.BINDIR, Base.LIBDIR, "julia"), joinpath(Sys.BINDIR, Base.LIBDIR)])
    global llvm_spirv_path = normpath(joinpath(artifact_dir, llvm_spirv_splitpath...))

    push!(PATH_list, dirname(llvm_spirv_path))
    global libLLVMSPIRV_path = normpath(joinpath(artifact_dir, libLLVMSPIRV_splitpath...))

    # Manually `dlopen()` this right now so that future invocations
    # of `ccall` with its `SONAME` will find this path immediately.
    global libLLVMSPIRV_handle = dlopen(libLLVMSPIRV_path)
    push!(LIBPATH_list, dirname(libLLVMSPIRV_path))

    # Filter out duplicate and empty entries in our PATH and LIBPATH entries
    filter!(!isempty, unique!(PATH_list))
    filter!(!isempty, unique!(LIBPATH_list))
    global PATH = join(PATH_list, ';')
    global LIBPATH = join(LIBPATH_list, ';')

    # Add each element of LIBPATH to our DL_LOAD_PATH (necessary on platforms
    # that don't honor our "already opened" trick)
    #for lp in LIBPATH_list
    #    push!(DL_LOAD_PATH, lp)
    #end
end  # __init__()

