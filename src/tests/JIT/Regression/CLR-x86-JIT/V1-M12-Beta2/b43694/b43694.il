// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly extern legacy library mscorlib {}
.assembly 'stobjfloat'
{
  
}
.assembly extern xunit.core {}
.class M
{
  .method public static int32 Main()
  {
    .custom instance void [xunit.core]Xunit.FactAttribute::.ctor() = (
        01 00 00 00
    )
    .entrypoint
    .maxstack 10
    .locals (float32 f)
    ldloca f
    ldc.r4 3.14
    stobj float32
    ldloc f
    call void [System.Console]System.Console::WriteLine(float32)
    ldc.i4 100
    ret
  }
}
