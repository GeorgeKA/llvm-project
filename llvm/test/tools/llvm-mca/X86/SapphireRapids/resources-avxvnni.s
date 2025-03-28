# NOTE: Assertions have been autogenerated by utils/update_mca_test_checks.py
# RUN: llvm-mca -mtriple=x86_64-unknown-unknown -mcpu=sapphirerapids -instruction-tables < %s | FileCheck %s

vpdpbusd    %xmm0, %xmm1, %xmm2
vpdpbusd    (%rax), %xmm1, %xmm2

vpdpbusd    %ymm0, %ymm1, %ymm2
vpdpbusd    (%rax), %ymm1, %ymm2

vpdpbusds   %xmm0, %xmm1, %xmm2
vpdpbusds   (%rax), %xmm1, %xmm2

vpdpbusds   %ymm0, %ymm1, %ymm2
vpdpbusds   (%rax), %ymm1, %ymm2

vpdpwssd    %xmm0, %xmm1, %xmm2
vpdpwssd    (%rax), %xmm1, %xmm2

vpdpwssd    %ymm0, %ymm1, %ymm2
vpdpwssd    (%rax), %ymm1, %ymm2

vpdpwssds   %xmm0, %xmm1, %xmm2
vpdpwssds   (%rax), %xmm1, %xmm2

vpdpwssds   %ymm0, %ymm1, %ymm2
vpdpwssds   (%rax), %ymm1, %ymm2

# CHECK:      Instruction Info:
# CHECK-NEXT: [1]: #uOps
# CHECK-NEXT: [2]: Latency
# CHECK-NEXT: [3]: RThroughput
# CHECK-NEXT: [4]: MayLoad
# CHECK-NEXT: [5]: MayStore
# CHECK-NEXT: [6]: HasSideEffects (U)

# CHECK:      [1]    [2]    [3]    [4]    [5]    [6]    Instructions:
# CHECK-NEXT:  1      5     0.50                        vpdpbusd	%xmm0, %xmm1, %xmm2
# CHECK-NEXT:  2      13    0.50    *                   vpdpbusd	(%rax), %xmm1, %xmm2
# CHECK-NEXT:  1      5     0.50                        vpdpbusd	%ymm0, %ymm1, %ymm2
# CHECK-NEXT:  2      13    0.50    *                   vpdpbusd	(%rax), %ymm1, %ymm2
# CHECK-NEXT:  1      5     0.50                        vpdpbusds	%xmm0, %xmm1, %xmm2
# CHECK-NEXT:  2      13    0.50    *                   vpdpbusds	(%rax), %xmm1, %xmm2
# CHECK-NEXT:  1      5     0.50                        vpdpbusds	%ymm0, %ymm1, %ymm2
# CHECK-NEXT:  2      13    0.50    *                   vpdpbusds	(%rax), %ymm1, %ymm2
# CHECK-NEXT:  1      5     0.50                        vpdpwssd	%xmm0, %xmm1, %xmm2
# CHECK-NEXT:  2      13    0.50    *                   vpdpwssd	(%rax), %xmm1, %xmm2
# CHECK-NEXT:  1      5     0.50                        vpdpwssd	%ymm0, %ymm1, %ymm2
# CHECK-NEXT:  2      13    0.50    *                   vpdpwssd	(%rax), %ymm1, %ymm2
# CHECK-NEXT:  1      5     0.50                        vpdpwssds	%xmm0, %xmm1, %xmm2
# CHECK-NEXT:  2      13    0.50    *                   vpdpwssds	(%rax), %xmm1, %xmm2
# CHECK-NEXT:  1      5     0.50                        vpdpwssds	%ymm0, %ymm1, %ymm2
# CHECK-NEXT:  2      13    0.50    *                   vpdpwssds	(%rax), %ymm1, %ymm2

# CHECK:      Resources:
# CHECK-NEXT: [0]   - SPRPort00
# CHECK-NEXT: [1]   - SPRPort01
# CHECK-NEXT: [2]   - SPRPort02
# CHECK-NEXT: [3]   - SPRPort03
# CHECK-NEXT: [4]   - SPRPort04
# CHECK-NEXT: [5]   - SPRPort05
# CHECK-NEXT: [6]   - SPRPort06
# CHECK-NEXT: [7]   - SPRPort07
# CHECK-NEXT: [8]   - SPRPort08
# CHECK-NEXT: [9]   - SPRPort09
# CHECK-NEXT: [10]  - SPRPort10
# CHECK-NEXT: [11]  - SPRPort11
# CHECK-NEXT: [12]  - SPRPortInvalid

# CHECK:      Resource pressure per iteration:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]
# CHECK-NEXT: 8.00   8.00   2.67   2.67    -      -      -      -      -      -     2.67    -      -

# CHECK:      Resource pressure by instruction:
# CHECK-NEXT: [0]    [1]    [2]    [3]    [4]    [5]    [6]    [7]    [8]    [9]    [10]   [11]   [12]   Instructions:
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     vpdpbusd	%xmm0, %xmm1, %xmm2
# CHECK-NEXT: 0.50   0.50   0.33   0.33    -      -      -      -      -      -     0.33    -      -     vpdpbusd	(%rax), %xmm1, %xmm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     vpdpbusd	%ymm0, %ymm1, %ymm2
# CHECK-NEXT: 0.50   0.50   0.33   0.33    -      -      -      -      -      -     0.33    -      -     vpdpbusd	(%rax), %ymm1, %ymm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     vpdpbusds	%xmm0, %xmm1, %xmm2
# CHECK-NEXT: 0.50   0.50   0.33   0.33    -      -      -      -      -      -     0.33    -      -     vpdpbusds	(%rax), %xmm1, %xmm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     vpdpbusds	%ymm0, %ymm1, %ymm2
# CHECK-NEXT: 0.50   0.50   0.33   0.33    -      -      -      -      -      -     0.33    -      -     vpdpbusds	(%rax), %ymm1, %ymm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     vpdpwssd	%xmm0, %xmm1, %xmm2
# CHECK-NEXT: 0.50   0.50   0.33   0.33    -      -      -      -      -      -     0.33    -      -     vpdpwssd	(%rax), %xmm1, %xmm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     vpdpwssd	%ymm0, %ymm1, %ymm2
# CHECK-NEXT: 0.50   0.50   0.33   0.33    -      -      -      -      -      -     0.33    -      -     vpdpwssd	(%rax), %ymm1, %ymm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     vpdpwssds	%xmm0, %xmm1, %xmm2
# CHECK-NEXT: 0.50   0.50   0.33   0.33    -      -      -      -      -      -     0.33    -      -     vpdpwssds	(%rax), %xmm1, %xmm2
# CHECK-NEXT: 0.50   0.50    -      -      -      -      -      -      -      -      -      -      -     vpdpwssds	%ymm0, %ymm1, %ymm2
# CHECK-NEXT: 0.50   0.50   0.33   0.33    -      -      -      -      -      -     0.33    -      -     vpdpwssds	(%rax), %ymm1, %ymm2
