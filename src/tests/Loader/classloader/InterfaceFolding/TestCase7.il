// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.

.assembly extern System.Console { }
.assembly extern xunit.core {}
.assembly extern mscorlib {}
.assembly TestCase0 {}


// =============== CLASS MEMBERS DECLARATION ===================
.class interface private abstract auto ansi I`1<T>
{ .method public hidebysig newslot abstract virtual instance string  Foo() cil managed {} }

.class interface private abstract auto ansi J`1<T>
{ 
  .method public hidebysig newslot abstract virtual instance string  Bar1() cil managed {}
  .method public hidebysig newslot abstract virtual instance string  Bar2() cil managed {}
}

.class private auto ansi beforefieldinit A`1<U> 
		implements class I`1<!U>, class J`1<!U>
{
  .method public hidebysig virtual instance string  Foo() cil managed
  {
    ldstr      "A::Foo"
    ret
  }
  .method public hidebysig virtual instance string  Bar1() cil managed
  {
    .maxstack  8
    ldstr      "A::Bar1"
    ret
  }
  .method public hidebysig virtual instance string  Bar2() cil managed
  {
    .maxstack  8
    ldstr      "A::Bar2"
    ret
  }
  .method public hidebysig specialname rtspecialname instance void .ctor() cil managed
  {
    ret
  }
}

.class private auto ansi beforefieldinit B`2<V,W>
       extends class A`1<!V>
       implements class I`1<!W>, class J`1<!W>
{
  .method public hidebysig newslot virtual instance string  Foo() cil managed
  {
    ldstr      "B::Foo"
    ret
  }
  .method public hidebysig newslot virtual instance string  Bar1() cil managed
  {
    .override  method instance string class A`1<!V>::Bar1()
    .maxstack  8
    ldstr      "B::Bar1"
    ret
  }
  .method public hidebysig virtual instance string  Bar2() cil managed
  {
    .maxstack  8
    ldstr      "B::Bar2"
    ret
  }
  .method public hidebysig specialname rtspecialname instance void .ctor() cil managed
  {
    ret
  }
}

.class private auto ansi beforefieldinit C extends class B`2<class C,class C>
{
  .method public hidebysig specialname rtspecialname instance void .ctor() cil managed
  {
    ret
  }
}

.class public auto ansi beforefieldinit Test_TestCase7 extends [mscorlib]System.Object
{
  .method public hidebysig static int32  Main() cil managed
  {
    .custom instance void [xunit.core]Xunit.FactAttribute::.ctor() = (
        01 00 00 00
    )
    .entrypoint

    newobj     instance void C::.ctor()
	callvirt   instance string class I`1<class C>::Foo()
    ldstr      "B::Foo"
    call       bool [mscorlib]System.String::op_Inequality(string, string)
    brtrue     FAILURE

    newobj     instance void C::.ctor()
    callvirt   instance string class A`1<class C>::Bar1()
    ldstr      "B::Bar1"
    call       bool [mscorlib]System.String::op_Inequality(string,string)
    brtrue     FAILURE    
	
	newobj     instance void C::.ctor()
    callvirt   instance string class A`1<class C>::Bar2()
    ldstr      "B::Bar2"
    call       bool [mscorlib]System.String::op_Inequality(string,string)
    brtrue     FAILURE
	
	newobj     instance void C::.ctor()
    callvirt   instance string class J`1<class C>::Bar2()
    ldstr      "B::Bar2"
    call       bool [mscorlib]System.String::op_Inequality(string,string)
    brtrue     FAILURE

	
	
PASS:
    ldstr      "Pass"
    call       void [System.Console]System.Console::WriteLine(string)
    ldc.i4.s   100
    ret

FAILURE:
    ldstr      "Failed!"
    call       void [System.Console]System.Console::WriteLine(string)
    ldc.i4.m1
    ret
  }
}
