add_lldb_library(lldbPluginUnwindAssemblyX86 PLUGIN
  UnwindAssembly-x86.cpp
  x86AssemblyInspectionEngine.cpp

  LINK_COMPONENTS
    Support
    MC
    MCDisassembler
  LINK_LIBS
    lldbCore
    lldbSymbol
    lldbTarget
    lldbUtility
  )
