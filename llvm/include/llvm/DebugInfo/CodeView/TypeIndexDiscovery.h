//===- TypeIndexDiscovery.h -------------------------------------*- C++ -*-===//
//
// Part of the LLVM Project, under the Apache License v2.0 with LLVM Exceptions.
// See https://llvm.org/LICENSE.txt for license information.
// SPDX-License-Identifier: Apache-2.0 WITH LLVM-exception
//
//===----------------------------------------------------------------------===//

#ifndef LLVM_DEBUGINFO_CODEVIEW_TYPEINDEXDISCOVERY_H
#define LLVM_DEBUGINFO_CODEVIEW_TYPEINDEXDISCOVERY_H

#include "llvm/ADT/ArrayRef.h"
#include "llvm/DebugInfo/CodeView/CVRecord.h"
#include "llvm/Support/Compiler.h"

namespace llvm {
template <typename T> class SmallVectorImpl;
namespace codeview {
class TypeIndex;
enum class TiRefKind { TypeRef, IndexRef };
struct TiReference {
  TiRefKind Kind;
  uint32_t Offset;
  uint32_t Count;
};

LLVM_ABI void discoverTypeIndices(ArrayRef<uint8_t> RecordData,
                                  SmallVectorImpl<TiReference> &Refs);
LLVM_ABI void discoverTypeIndices(const CVType &Type,
                                  SmallVectorImpl<TiReference> &Refs);
LLVM_ABI void discoverTypeIndices(const CVType &Type,
                                  SmallVectorImpl<TypeIndex> &Indices);
LLVM_ABI void discoverTypeIndices(ArrayRef<uint8_t> RecordData,
                                  SmallVectorImpl<TypeIndex> &Indices);

/// Discover type indices in symbol records. Returns false if this is an unknown
/// record.
LLVM_ABI bool discoverTypeIndicesInSymbol(const CVSymbol &Symbol,
                                          SmallVectorImpl<TiReference> &Refs);
LLVM_ABI bool discoverTypeIndicesInSymbol(ArrayRef<uint8_t> RecordData,
                                          SmallVectorImpl<TiReference> &Refs);
LLVM_ABI bool discoverTypeIndicesInSymbol(ArrayRef<uint8_t> RecordData,
                                          SmallVectorImpl<TypeIndex> &Indices);
}
}

#endif
