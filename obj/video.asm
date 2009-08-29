	.file "src/video.bas"
	.stabs "src/video.bas",100,0,0,.Lt_0001

.section .text
.Lt_0001:
	.stabs "integer:t1=-1",128,0,0,0
	.stabs "void:t7=-11",128,0,0,0
	.stabs "byte:t2=-6",128,0,0,0
	.stabs "ubyte:t3=-5",128,0,0,0
	.stabs "char:t4=-2",128,0,0,0
	.stabs "short:t5=-3",128,0,0,0
	.stabs "ushort:t6=-7",128,0,0,0
	.stabs "uinteger:t8=-8",128,0,0,0
	.stabs "longint:t9=-31",128,0,0,0
	.stabs "ulongint:t10=-32",128,0,0,0
	.stabs "single:t11=-12",128,0,0,0
	.stabs "double:t12=-13",128,0,0,0
	.stabs "string:t13=s12data:15,0,32;len:1,32,32;size:1,64,32;;",128,0,0,0
	.stabs "fixstr:t14=-2",128,0,0,0
	.stabs "pchar:t15=*4;",128,0,0,0

	.stabs "src/video.bas",130,0,0,0
	.intel_syntax noprefix

	#src/video.bas' compilation started at 23:10:09 (FreeBASIC v0.20.0b)
	.stabs "OUTPORTB:F7",36,0,29,outportb
	.stabs "PORT:p1",160,0,0,8
	.stabs "VALUE:p3",160,0,0,12
.balign 16

.globl outportb
outportb:
.type outportb, @function
	push ebp
	mov ebp, esp
	push ebx
	push esi
	push edi
	.stabn 68,0,29,outportb-outportb
.Lt_0004:
.Lt_0006:
##Asm
call outportb [ebp+8] [ebp+12]
##   Asm	call outportb [port] [value]
.stabn 68,0,31,.Lt_0006-outportb
.Lt_0007:
##   End 
.Lt_0005:
	pop edi
	pop esi
	pop ebx
	mov esp, ebp
	pop ebp
	ret
.size outportb, .-outportb
	.stabn 68,0,33,.Lt_0005-outportb
	.stabn 192,0,0,.Lt_0004-outportb
	.stabn 224,0,0,.Lt_0005-outportb
.Lt_0008:
	.stabs "",36,0,0,.Lt_0008-outportb
	.stabs "CLEARCONSOLE:F7",36,0,34,CLEARCONSOLE
.balign 16

.globl CLEARCONSOLE
CLEARCONSOLE:
.type CLEARCONSOLE, @function
	push ebp
	mov ebp, esp
	sub esp, 8
	.stabn 68,0,34,CLEARCONSOLE-CLEARCONSOLE
.Lt_0009:
.Lt_0013:
##  Dim scrnptr As Byte Ptr = CPtr(Byte Ptr, VideoAddress)' + (2 * 80))
	mov dword ptr [ebp-4], 753664
.stabn 68,0,35,.Lt_0013-CLEARCONSOLE
.Lt_0014:
##  For I As Integer = 0 To 80 * (20)'
.Lt_000B:
	mov dword ptr [ebp-8], 0
.Lt_000F:
.Lt_0010:
.stabn 68,0,36,.Lt_0014-CLEARCONSOLE
.Lt_0015:
##	*scrnptr = 0'
	mov eax, dword ptr [ebp-4]
	mov byte ptr [eax], 0
.stabn 68,0,37,.Lt_0015-CLEARCONSOLE
.Lt_0016:
##	scrnptr += 1
	inc dword ptr [ebp-4]
.stabn 68,0,38,.Lt_0016-CLEARCONSOLE
.Lt_0017:
##   Next   
.Lt_0011:
.Lt_000D:
	inc dword ptr [ebp-8]
.Lt_000C:
	cmp dword ptr [ebp-8], 1600
	jle .Lt_000F
.Lt_000E:
.Lt_0012:
.stabn 68,0,39,.Lt_0017-CLEARCONSOLE
.Lt_0018:
##   csrx = 10
	mov dword ptr [CSRX], 10
.stabn 68,0,40,.Lt_0018-CLEARCONSOLE
.Lt_0019:
##   csry = 50
	mov dword ptr [CSRY], 50
.stabn 68,0,41,.Lt_0019-CLEARCONSOLE
.Lt_001A:
##   
##   outportb &H3D4, 14
	push 14
	push 980
	call outportb
	add esp, 8
.stabn 68,0,43,.Lt_001A-CLEARCONSOLE
.Lt_001B:
##   outportb &H3D5, 1 Shr 8
	push 0
	push 981
	call outportb
	add esp, 8
.stabn 68,0,44,.Lt_001B-CLEARCONSOLE
.Lt_001C:
##   outportb &H3D4, 15
	push 15
	push 980
	call outportb
	add esp, 8
.stabn 68,0,45,.Lt_001C-CLEARCONSOLE
.Lt_001D:
##   outportb &H3D4, 1
	push 1
	push 980
	call outportb
	add esp, 8
.stabn 68,0,46,.Lt_001D-CLEARCONSOLE
.Lt_001E:
.Lt_000A:
	mov esp, ebp
	pop ebp
	ret
.size CLEARCONSOLE, .-CLEARCONSOLE
	.stabn 68,0,47,.Lt_000A-CLEARCONSOLE
	.stabs "SCRNPTR:16=*2",128,0,0,-4
	.stabn 192,0,0,.Lt_0009-CLEARCONSOLE
	.stabs "I:1",128,0,0,-8
	.stabn 192,0,0,.Lt_000B-CLEARCONSOLE
	.stabn 192,0,0,.Lt_0010-CLEARCONSOLE
	.stabn 224,0,0,.Lt_0011-CLEARCONSOLE
	.stabn 224,0,0,.Lt_0012-CLEARCONSOLE
	.stabn 224,0,0,.Lt_000A-CLEARCONSOLE
.Lt_001F:
	.stabs "",36,0,0,.Lt_001F-CLEARCONSOLE
	.stabs "INITCONSOLE:F7",36,0,48,INITCONSOLE
.balign 16

.globl INITCONSOLE
INITCONSOLE:
.type INITCONSOLE, @function
	push ebp
	mov ebp, esp
	.stabn 68,0,48,INITCONSOLE-INITCONSOLE
.Lt_0020:
.Lt_0022:
##   ClearConsole ()   	
	call CLEARCONSOLE
.stabn 68,0,49,.Lt_0022-INITCONSOLE
.Lt_0023:
.Lt_0021:
	mov esp, ebp
	pop ebp
	ret
.size INITCONSOLE, .-INITCONSOLE
	.stabn 68,0,50,.Lt_0021-INITCONSOLE
	.stabn 192,0,0,.Lt_0020-INITCONSOLE
	.stabn 224,0,0,.Lt_0021-INITCONSOLE
.Lt_0024:
	.stabs "",36,0,0,.Lt_0024-INITCONSOLE
	.stabs "PRINTSTRING:F7",36,0,51,PRINTSTRING
	.stabs "SRC:p17=*3",160,0,0,8
	.stabs "COLUMN:p1",160,0,0,12
	.stabs "ROW:p1",160,0,0,16
	.stabs "C:p1",160,0,0,20
.balign 16

.globl PRINTSTRING
PRINTSTRING:
.type PRINTSTRING, @function
	push ebp
	mov ebp, esp
	push ebx
	.stabn 68,0,51,PRINTSTRING-PRINTSTRING
.Lt_0025:
.Lt_002B:
##  
##    while src[counter] <> 0
.Lt_0027:
	mov eax, dword ptr [ebp+8]
	add eax, dword ptr [COUNTER]
	movzx ebx, byte ptr [eax]
	test ebx, ebx
	je .Lt_0028
.Lt_0029:
.stabn 68,0,53,.Lt_002B-PRINTSTRING
.Lt_002C:
##	PrintChar(CPtr(UByte Ptr, @src[counter]), c)
	push dword ptr [ebp+20]
	mov ebx, dword ptr [ebp+8]
	add ebx, dword ptr [COUNTER]
	push ebx
	call PRINTCHAR
	add esp, 8
.stabn 68,0,54,.Lt_002C-PRINTSTRING
.Lt_002D:
##	'currcol += 1
##	'currentCol = currcol
##        'dst[2 * counter + 1] = c
##	'dst[2 * counter] = src[counter]
##	'dstVar = dst[2 * counter + 1]
##        'counter = counter + 1
##	'If counter = 80 Then 
##	''    currrow += 1
##	 '   currentRow = currrow	    
##	'End If
##    wend    
.Lt_002A:
	jmp .Lt_0027
.Lt_0028:
.stabn 68,0,65,.Lt_002D-PRINTSTRING
.Lt_002E:
.Lt_0026:
	pop ebx
	mov esp, ebp
	pop ebp
	ret
.size PRINTSTRING, .-PRINTSTRING
	.stabn 68,0,66,.Lt_0026-PRINTSTRING
	.stabn 192,0,0,.Lt_0025-PRINTSTRING
	.stabn 192,0,0,.Lt_0029-PRINTSTRING
	.stabn 224,0,0,.Lt_002A-PRINTSTRING
	.stabn 224,0,0,.Lt_0026-PRINTSTRING
.Lt_002F:
	.stabs "",36,0,0,.Lt_002F-PRINTSTRING
	.stabs "PRINTCHAR:F7",36,0,67,PRINTCHAR
	.stabs "CHARC:p18=*3",160,0,0,8
	.stabs "COLORVALUE:p1",160,0,0,12
.balign 16

.globl PRINTCHAR
PRINTCHAR:
.type PRINTCHAR, @function
	push ebp
	mov ebp, esp
	push ebx
	.stabn 68,0,67,PRINTCHAR-PRINTCHAR
.Lt_0030:
.Lt_0038:
##    dst = CPtr(Byte Ptr, &HB8000 + currrow + 1 * 160 + currcol * 2)
	mov eax, dword ptr [CURRCOL]
	sal eax, 1
	mov ebx, dword ptr [CURRROW]
	add ebx, eax
	add ebx, 753824
	mov eax, ebx
	mov dword ptr [DST], eax
.stabn 68,0,68,.Lt_0038-PRINTCHAR
.Lt_0039:
##    If currcol >= 80 Then
	cmp dword ptr [CURRCOL], 80
	jl .Lt_0033
.Lt_0034:
.stabn 68,0,69,.Lt_0039-PRINTCHAR
.Lt_003A:
##	currrow += 1
	inc dword ptr [CURRROW]
.stabn 68,0,70,.Lt_003A-PRINTCHAR
.Lt_003B:
##	currcol = 0
	mov dword ptr [CURRCOL], 0
.stabn 68,0,71,.Lt_003B-PRINTCHAR
.Lt_003C:
##	ScrollUp()
	call SCROLLUP
.stabn 68,0,72,.Lt_003C-PRINTCHAR
.Lt_003D:
##    Else
.Lt_0035:
	jmp .Lt_0032
.Lt_0033:
.Lt_0036:
.stabn 68,0,73,.Lt_003D-PRINTCHAR
.Lt_003E:
##	currcol += 1
	inc dword ptr [CURRCOL]
.stabn 68,0,74,.Lt_003E-PRINTCHAR
.Lt_003F:
##	'dst = colorValue
##	dst = charc 
	mov eax, dword ptr [ebp+8]
	mov dword ptr [DST], eax
.stabn 68,0,76,.Lt_003F-PRINTCHAR
.Lt_0040:
##    End If
.Lt_0037:
.Lt_0032:
.Lt_0031:
	pop ebx
	mov esp, ebp
	pop ebp
	ret
.size PRINTCHAR, .-PRINTCHAR
	.stabn 68,0,78,.Lt_0031-PRINTCHAR
	.stabn 192,0,0,.Lt_0030-PRINTCHAR
	.stabn 192,0,0,.Lt_0034-PRINTCHAR
	.stabn 224,0,0,.Lt_0035-PRINTCHAR
	.stabn 192,0,0,.Lt_0036-PRINTCHAR
	.stabn 224,0,0,.Lt_0037-PRINTCHAR
	.stabn 224,0,0,.Lt_0031-PRINTCHAR
.Lt_0041:
	.stabs "",36,0,0,.Lt_0041-PRINTCHAR
	.stabs "SCROLLUP:F7",36,0,79,SCROLLUP
.balign 16

.globl SCROLLUP
SCROLLUP:
.type SCROLLUP, @function
	push ebp
	mov ebp, esp
	push ebx
	.stabn 68,0,79,SCROLLUP-SCROLLUP
.Lt_0042:
.Lt_0044:
##   memcpy(CPtr(Any Ptr, VideoAddress), CPtr(Any Ptr, VideoAddress + (columns *2)), (((rows -1) * columns) * 2))
	mov eax, dword ptr [ROWS]
	dec eax
	imul eax, dword ptr [COLUMNS]
	sal eax, 1
	push eax
	mov eax, dword ptr [COLUMNS]
	sal eax, 1
	add eax, 753664
	mov ebx, eax
	push ebx
	push 753664
	call MEMCPY
	add esp, 12
.stabn 68,0,80,.Lt_0044-SCROLLUP
.Lt_0045:
##   memsetw(CPtr(UShort Ptr, VideoAddress + (((rows - 1) * columns) * 2)), 13, columns)
	push dword ptr [COLUMNS]
	push 13
	mov ebx, dword ptr [ROWS]
	dec ebx
	imul ebx, dword ptr [COLUMNS]
	sal ebx, 1
	add ebx, 753664
	mov eax, ebx
	push eax
	call MEMSETW
	add esp, 12
.stabn 68,0,81,.Lt_0045-SCROLLUP
.Lt_0046:
.Lt_0043:
	pop ebx
	mov esp, ebp
	pop ebp
	ret
.size SCROLLUP, .-SCROLLUP
	.stabn 68,0,82,.Lt_0043-SCROLLUP
	.stabn 192,0,0,.Lt_0042-SCROLLUP
	.stabn 224,0,0,.Lt_0043-SCROLLUP
.Lt_0047:
	.stabs "",36,0,0,.Lt_0047-SCROLLUP
	.stabs "{MODLEVEL}:f7",36,0,1,fb_ctor__video
.balign 16
fb_ctor__video:
.type fb_ctor__video, @function
	push ebp
	mov ebp, esp
	.stabn 68,0,1,fb_ctor__video-fb_ctor__video
.Lt_0002:
.Lt_0048:
##
###include "x86.bi"
##Declare Sub ScrollUp ()
##Declare Sub PrintString (src As UByte Ptr, x As Long, y As Long, c As Long)
##Declare Sub PrintChar(char as UByte Ptr, colorValue As Long)
##'Declare Sub outportb Cdecl Alias "outportb" (port As Integer, value As Unsigned Byte)
##
##Declare Function memcpy (dest As Any Ptr, src As Any Ptr, count As Integer) As Integer Ptr
##Declare Function memsetw(des As UShort Ptr, value As UShort, cnt As Integer) As UShort Ptr
##
##Dim Shared currrow As Long = 0
##Dim Shared cursor As UInteger Ptr
##Dim Shared columns As Integer = 80
##Dim Shared rows As Integer = 20
##Dim Shared csry As Integer
##Dim Shared csrx As Integer
##Dim Shared currcol As Integer = 0
##Dim Shared dst as Byte Ptr
##Dim Shared dstVar As Byte 
##Dim Shared counter as Long
##
##Const videofinalad = &HBB232
##Const VideoAddress = &HB8000
##Const cursoraddr = &HB903C
##
##Extern "C"
##   Declare Sub inportb(_port As UShort)
##   Declare Sub SetCursor(csr_x As Integer, csr_y As Integer)	
##End Extern
##
.Lt_0003:
	mov esp, ebp
	pop ebp
	ret
.size fb_ctor__video, .-fb_ctor__video
	.stabn 68,0,83,.Lt_0003-fb_ctor__video
	.stabn 192,0,0,.Lt_0002-fb_ctor__video
	.stabn 224,0,0,.Lt_0003-fb_ctor__video
.Lt_0049:
	.stabs "",36,0,0,.Lt_0049-fb_ctor__video
	#src/video.bas' compilation took 0.002219990477897227 secs

.section .data
	.stabs "CURRROW:S1",38,0,0,CURRROW
.balign 4
CURRROW:
.long 0

.section .bss
.balign 4
	.lcomm	CURSOR,4
	.stabs "CURSOR:S19=*8",40,0,0,CURSOR

.section .data
	.stabs "COLUMNS:S1",38,0,0,COLUMNS
.balign 4
COLUMNS:
.int 80
	.stabs "ROWS:S1",38,0,0,ROWS
.balign 4
ROWS:
.int 20

.section .bss
.balign 4
	.lcomm	CSRY,4
	.stabs "CSRY:S1",40,0,0,CSRY
.balign 4
	.lcomm	CSRX,4
	.stabs "CSRX:S1",40,0,0,CSRX

.section .data
	.stabs "CURRCOL:S1",38,0,0,CURRCOL
.balign 4
CURRCOL:
.int 0

.section .bss
.balign 4
	.lcomm	DST,4
	.stabs "DST:S20=*2",40,0,0,DST
.balign 4
	.lcomm	DSTVAR,1
	.stabs "DSTVAR:S2",40,0,0,DSTVAR
.balign 4
	.lcomm	COUNTER,4
	.stabs "COUNTER:S1",40,0,0,COUNTER

.section .ctors, "aw", @progbits
.int fb_ctor__video

.section .text
	.stabs "",100,0,0,.Lt_004A
.Lt_004A:
