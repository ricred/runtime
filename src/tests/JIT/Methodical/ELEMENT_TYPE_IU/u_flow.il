// Licensed to the .NET Foundation under one or more agreements.
// The .NET Foundation licenses this file to you under the MIT license.







.assembly extern mscorlib { }
.assembly extern System.Console
{
  .publickeytoken = (B0 3F 5F 7F 11 D5 0A 3A )
  .ver 4:0:0:0
}
.assembly 'qsort'// as "qsort"
{
}
.assembly extern xunit.core {}
.module 'qsort.exe'
// MVID: {3433C0F8-3BEA-4168-AB0C-C275EF054928}
.namespace Test
{
  .class private auto ansi AA extends [mscorlib]System.Object
  {
	.field public native unsigned int m_i
	.field public native unsigned int[0...] m_ai

    .method private hidebysig static int32 Main() il managed
    {
		.custom instance void [xunit.core]Xunit.FactAttribute::.ctor() = (
		    01 00 00 00
		)
		.entrypoint
		// Code size       134 (0x86)
		.maxstack  8
		.locals (class Test.AA, native unsigned int i, native unsigned int& p1, native unsigned int& p2)
		newobj instance void Test.AA::.ctor()
		stloc.0
		
		ldloc.0
		ldc.i4 0x80000000
		conv.u
		stfld native unsigned int Test.AA::m_i

		ldloc.0
		ldfld native unsigned int Test.AA::m_i
		ldc.i4 0x7fffffff
		conv.u
		blt.un fail

		ldloc.0
		ldfld native unsigned int Test.AA::m_i
		ldc.i4 0x80000001
		conv.u
		bgt.un fail

		ldloc.0
		ldfld native unsigned int Test.AA::m_i
		ldc.i4 0x80000001
		conv.u
		bgt.un fail

		ldc.i4.0
		stloc i

	again:
		ldloc i
		switch (a1,a2,a3,a4,a5,a6,stop)
	a1:
		ldloca i
		br merge_1
	a2:
		ldloca i
	merge_2:
		ldloc.0
		ldfld native unsigned int[0...] Test.AA::m_ai
		ldc.i4.1
		ldelema [mscorlib]System.IntPtr
		br final_merge
	a3:
		ldloc.0
		ldflda native unsigned int Test.AA::m_i
	merge_3:
		ldloca i
		br final_merge
	a4:
		ldloc.0
		ldflda native unsigned int Test.AA::m_i
		br merge_2
	a5:
		ldloc.0
		ldfld native unsigned int[0...] Test.AA::m_ai
		ldc.i4.1
		ldelema [mscorlib]System.IntPtr
		br merge_3
	a6:
		ldloc.0
		ldfld native unsigned int[0...] Test.AA::m_ai
		ldc.i4.1
		ldelema [mscorlib]System.IntPtr
	merge_1:
		ldloc.0
		ldflda native unsigned int Test.AA::m_i
	final_merge:
		stloc p1
		stloc p2
		ldloc p1
		ldloc p2
		beq fail
		
		ldloc p1
		ldind.i
		dup
		ldloc p2
		ldind.i
		add
		sub
		ldloc p2
		ldind.i
		ceq
		brfalse fail

		ldloc i
		ldc.i4.1
		add.ovf.un
		stloc i

	stop:
		ldc.i4 0x64
		ldstr "passed"
		br exit

	fail:
		ldc.i4.1
		ldstr "failed"
	exit:
		call void [System.Console]System.Console::WriteLine(class [mscorlib]System.String)
		ret
    } // end of method 'AA::Main'

    .method public hidebysig specialname rtspecialname 
            instance void .ctor() il managed
    {
      // Code size       7 (0x7)
      .maxstack  8
      ldarg.0
      call       instance void [mscorlib]System.Object::.ctor()
      ldarg.0
      ldc.i4.0
      stfld		native unsigned int Test.AA::m_i
      ldarg.0
      ldc.i4.8
      newobj   instance void native unsigned int[0...]::.ctor(int32)
      stfld		native unsigned int[0...] Test.AA::m_ai
      ret
    } // end of method 'AA::.ctor'

  } // end of class 'AA'

} // end of namespace 'Test'

//*********** DISASSEMBLY COMPLETE ***********************
