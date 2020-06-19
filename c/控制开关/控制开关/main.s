;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8A050D,c=on
	#include "ny8a050d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	_read_14bit_rom
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_BPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_BPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_TBHP
	extern	_TBHD
	extern	_OSCCR
	extern	_IOSTB
	extern	_PS0CV
	extern	_BODCON
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_gotoSleep
	extern	_keyRead
	extern	_init
	extern	_processKey
	extern	_outCon
	extern	_isr
	extern	_main
	extern	_intCount
	extern	_IntFlag
	extern	_keyClick
	extern	_workStep
	extern	_keyCount
	extern	_longPressFlag
	extern	_count

	extern PSAVE
	extern SSAVE
	extern WSAVE
	extern STK12
	extern STK11
	extern STK10
	extern STK09
	extern STK08
	extern STK07
	extern STK06
	extern STK05
	extern STK04
	extern STK03
	extern STK02
	extern STK01
	extern STK00

.segment "uninit", 0x20000010
PSAVE:
	.res 1
SSAVE:
	.res 1
WSAVE:
	.res 1
STK12:
	.res 1
STK11:
	.res 1
STK10:
	.res 1
STK09:
	.res 1
STK08:
	.res 1
STK07:
	.res 1
STK06:
	.res 1
STK05:
	.res 1
STK04:
	.res 1
STK03:
	.res 1
STK02:
	.res 1
STK01:
	.res 1
STK00:
	.res 1

;--------------------------------------------------------
; global definitions
;--------------------------------------------------------
;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x100E:
	.res	1
.segment "uninit"
r0x100D:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyClick:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyClick,2byte,array=0,entsize=2,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00, 0x00
	.debuginfo gvariable name=_keyCount,2byte,array=0,entsize=2,ext=1


.segment "idata"
_longPressFlag:
	dw	0x00
	.debuginfo gvariable name=_longPressFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_count:
	dw	0x00, 0x00
	.debuginfo gvariable name=_count,2byte,array=0,entsize=2,ext=1

;--------------------------------------------------------
; overlayable items in internal ram 
;--------------------------------------------------------
;	udata_ovr
;--------------------------------------------------------
; reset vector 
;--------------------------------------------------------
ORG	0x0000
	LGOTO	__nyc_ny8_startup
;--------------------------------------------------------
; interrupt and initialization code
;--------------------------------------------------------
ORG 0x0008
	lgoto	__sdcc_interrupt

.segment "code"
__sdcc_interrupt:
;***
;  pBlock Stats: dbName = I
;***
;2 compiler assigned registers:
;   STK00
;   STK01
;; Starting pCode block
_isr:
; 0 exit points
	.line	23, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	MOVAR	___sdcc_saved_stk01
	.line	25, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	27, "main.c"; 	TMR0 = 65;
	MOVIA	0x41
	MOVAR	_TMR0
	.line	28, "main.c"; 	intCount++;
	INCR	_intCount,F
	.line	29, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	31, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	32, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	MOVAR	_IntFlag
_00108_DS_:
	.line	35, "main.c"; 	if(INTFbits.PBIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	37, "main.c"; 	INTF= (unsigned char)~(C_INT_PBKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	40, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	42, "main.c"; 	}
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	MOVR	___sdcc_saved_fsr,W
	MOVAR	FSR
	MOVR	PSAVE,W
	MOVAR	PCHBUF
	CLRR	STATUS
	SWAPR	SSAVE,W
	MOVAR	STATUS
	SWAPR	WSAVE,F
	SWAPR	WSAVE,W
END_OF_INTERRUPT:
	RETIE	

;--------------------------------------------------------
; code
;--------------------------------------------------------
;***
;  pBlock Stats: dbName = M
;***
;has an exit
;functions called:
;   _init
;   _processKey
;   _outCon
;   _init
;   _processKey
;   _outCon
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	47, "main.c"; 	init();
	LCALL	_init
_00118_DS_:
	.line	51, "main.c"; 	CLRWDT(); 
	clrwdt
	.line	52, "main.c"; 	if(!IntFlag)
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00118_DS_
	.line	54, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	55, "main.c"; 	processKey();
	LCALL	_processKey
	.line	56, "main.c"; 	outCon();
	LCALL	_outCon
	LGOTO	_00118_DS_
	.line	60, "main.c"; 	}
	RETURN	
; exit point of _main

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_gotoSleep
	.debuginfo subprogram _gotoSleep
_gotoSleep:
; 2 exit points
	.line	209, "main.c"; 	PORTB = 0x01; 
	MOVIA	0x01
	MOVAR	_PORTB
	.line	210, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	211, "main.c"; 	count = 0;
	CLRR	_count
	CLRR	(_count + 1)
	.line	212, "main.c"; 	BWUCON = 0x01;		//PB0唤醒
	MOVIA	0x01
	MOVAR	_BWUCON
	.line	213, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PBKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	214, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	215, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	216, "main.c"; 	CLRWDT();
	clrwdt
	.line	217, "main.c"; 	SLEEP();
	sleep
	.line	218, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	219, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	221, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT ,  Enable LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	222, "main.c"; 	PCON |= 0x10;			//PA5关闭上拉
	BSR	_PCON,4
	.line	223, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x100D
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x100D
_keyRead:
; 2 exit points
	.line	169, "main.c"; 	char keyRead(char KeyStatus)	
	MOVAR	r0x100D
	.line	171, "main.c"; 	if (KeyStatus)
	MOVR	r0x100D,W
	BTRSC	STATUS,2
	LGOTO	_00232_DS_
	.line	173, "main.c"; 	keyCount++;
	INCR	_keyCount,F
	BTRSC	STATUS,2
	INCR	(_keyCount + 1),F
;;unsigned compare: left < lit (0x12C=300), size=2
	.line	174, "main.c"; 	if(keyCount >= 300)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00254_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00254_DS_:
	BTRSS	STATUS,0
	LGOTO	_00233_DS_
;;unsigned compare: left < lit (0xBB8=3000), size=2
	.line	176, "main.c"; 	if(keyCount >= 3000)
	MOVIA	0x0b
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00255_DS_
	MOVIA	0xb8
	SUBAR	_keyCount,W
_00255_DS_:
	BTRSS	STATUS,0
	LGOTO	_00221_DS_
	.line	178, "main.c"; 	return 3;	//30S超时
	MOVIA	0x03
	LGOTO	_00234_DS_
_00221_DS_:
	.line	180, "main.c"; 	if(!longPressFlag)
	MOVR	_longPressFlag,W
	BTRSS	STATUS,2
	LGOTO	_00233_DS_
	.line	182, "main.c"; 	longPressFlag = 1;
	MOVIA	0x01
	MOVAR	_longPressFlag
	.line	183, "main.c"; 	return 2;
	MOVIA	0x02
	LGOTO	_00234_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00232_DS_:
	.line	189, "main.c"; 	if(keyCount >= 300)
	MOVIA	0x01
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00256_DS_
	MOVIA	0x2c
	SUBAR	_keyCount,W
_00256_DS_:
	BTRSS	STATUS,0
	LGOTO	_00229_DS_
	.line	191, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	192, "main.c"; 	longPressFlag = 0;
	CLRR	_longPressFlag
	.line	193, "main.c"; 	return	0;
	MOVIA	0x00
	LGOTO	_00234_DS_
;;unsigned compare: left < lit (0x8=8), size=2
_00229_DS_:
	.line	195, "main.c"; 	else if(keyCount >= 8)
	MOVIA	0x00
	SUBAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00257_DS_
	MOVIA	0x08
	SUBAR	_keyCount,W
_00257_DS_:
	BTRSS	STATUS,0
	LGOTO	_00230_DS_
	.line	197, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
	.line	198, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00234_DS_
_00230_DS_:
	.line	200, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	CLRR	(_keyCount + 1)
_00233_DS_:
	.line	202, "main.c"; 	return 0;
	MOVIA	0x00
_00234_DS_:
	.line	203, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;; Starting pCode block
.segment "code"; module=main, function=_init
	.debuginfo subprogram _init
_init:
; 2 exit points
	.line	145, "main.c"; 	PORTB = 0x00;         
	CLRR	_PORTB
	.line	146, "main.c"; 	IOSTB =  C_PB0_Input;								// Set PB to output mode
	MOVIA	0x01
	IOST	_IOSTB
	.line	147, "main.c"; 	BPHCON = 0xFE;
	MOVIA	0xfe
	MOVAR	_BPHCON
	.line	148, "main.c"; 	BPLCON = 0xFF;
	MOVIA	0xff
	MOVAR	_BPLCON
	.line	149, "main.c"; 	PORTB = 0x01;                           	
	MOVIA	0x01
	MOVAR	_PORTB
	.line	153, "main.c"; 	PCON = C_WDT_En | C_LVR_En;				// Enable WDT & LVR
	MOVIA	0x88
	MOVAR	_PCON
	.line	154, "main.c"; 	INTE =  C_INT_TMR0;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x01
	MOVAR	_INTE
	.line	155, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	158, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	160, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	161, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	163, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	165, "main.c"; 	ENI();
	ENI
	.line	166, "main.c"; 	}
	RETURN	
; exit point of _init

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _keyRead
;   _gotoSleep
;   _gotoSleep
;   _keyRead
;   _gotoSleep
;   _gotoSleep
;1 compiler assigned register :
;   r0x100E
;; Starting pCode block
.segment "code"; module=main, function=_processKey
	.debuginfo subprogram _processKey
_processKey:
; 2 exit points
	.line	104, "main.c"; 	keyClick = keyRead((~PORTB)&0x01);
	COMR	_PORTB,W
	MOVAR	r0x100E
	MOVIA	0x01
	ANDAR	r0x100E,F
	MOVR	r0x100E,W
	LCALL	_keyRead
	MOVAR	r0x100E
	MOVAR	_keyClick
	CLRR	(_keyClick + 1)
	.line	105, "main.c"; 	if(workStep == 10)
	MOVR	_workStep,W
	XORIA	0x0a
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	.line	107, "main.c"; 	PORTB &= ~0x32;
	MOVIA	0xcd
	ANDAR	_PORTB,F
	.line	108, "main.c"; 	if(--count == 0)
	MOVIA	0xff
	ADDAR	_count,F
	BTRSS	STATUS,0
	DECR	(_count + 1),F
	MOVR	_count,W
	IORAR	(_count + 1),W
	BTRSS	STATUS,2
	LGOTO	_00196_DS_
	.line	110, "main.c"; 	workStep = 2;	//3分钟后进入中档
	MOVIA	0x02
	MOVAR	_workStep
_00196_DS_:
	.line	113, "main.c"; 	if(keyClick == 1 && workStep)
	MOVR	_keyClick,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	MOVR	(_keyClick + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00208_DS_
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00208_DS_
	.line	115, "main.c"; 	count = 0;
	CLRR	_count
	CLRR	(_count + 1)
	.line	116, "main.c"; 	PORTB &= ~0x32;
	MOVIA	0xcd
	ANDAR	_PORTB,F
	.line	117, "main.c"; 	if(++workStep >= 4)
	INCR	_workStep,F
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSS	STATUS,0
	LGOTO	_00211_DS_
	.line	119, "main.c"; 	workStep = 1;
	MOVIA	0x01
	MOVAR	_workStep
	LGOTO	_00211_DS_
_00208_DS_:
	.line	123, "main.c"; 	else if(keyClick == 2)
	MOVR	_keyClick,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00205_DS_
	MOVR	(_keyClick + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00205_DS_
	.line	125, "main.c"; 	if(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00200_DS_
	.line	127, "main.c"; 	workStep = 0;	//关机
	CLRR	_workStep
	.line	128, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00211_DS_
_00200_DS_:
	.line	132, "main.c"; 	workStep = 10;//预热模式
	MOVIA	0x0a
	MOVAR	_workStep
	.line	133, "main.c"; 	count = 18000;
	MOVIA	0x50
	MOVAR	_count
	MOVIA	0x46
	MOVAR	(_count + 1)
	LGOTO	_00211_DS_
_00205_DS_:
	.line	136, "main.c"; 	else if(keyClick == 3)
	MOVR	_keyClick,W
	XORIA	0x03
	BTRSS	STATUS,2
	LGOTO	_00211_DS_
	MOVR	(_keyClick + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00211_DS_
	.line	138, "main.c"; 	workStep = 0;	//超时关机
	CLRR	_workStep
	.line	139, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
_00211_DS_:
	.line	141, "main.c"; 	}
	RETURN	
; exit point of _processKey

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _gotoSleep
;   _gotoSleep
;; Starting pCode block
.segment "code"; module=main, function=_outCon
	.debuginfo subprogram _outCon
_outCon:
; 2 exit points
	.line	65, "main.c"; 	switch(workStep)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
	MOVR	_workStep,W
	XORIA	0x01
	BTRSC	STATUS,2
	LGOTO	_00127_DS_
	MOVR	_workStep,W
	XORIA	0x02
	BTRSC	STATUS,2
	LGOTO	_00130_DS_
	MOVR	_workStep,W
	XORIA	0x03
	BTRSC	STATUS,2
	LGOTO	_00133_DS_
	MOVR	_workStep,W
	XORIA	0x0a
	BTRSC	STATUS,2
	LGOTO	_00136_DS_
	LGOTO	_00137_DS_
_00123_DS_:
	.line	68, "main.c"; 	if((!keyCount) &&++count == 200)
	MOVR	_keyCount,W
	IORAR	(_keyCount + 1),W
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	INCR	_count,F
	BTRSC	STATUS,2
	INCR	(_count + 1),F
	MOVR	_count,W
	XORIA	0xc8
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	MOVR	(_count + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	.line	69, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	.line	70, "main.c"; 	break;
	LGOTO	_00137_DS_
_00127_DS_:
	.line	72, "main.c"; 	PORTB |= 0x20;
	BSR	_PORTB,5
	.line	73, "main.c"; 	if(count == 300)
	MOVR	_count,W
	XORIA	0x2c
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	MOVR	(_count + 1),W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	.line	74, "main.c"; 	PORTB &= 0xFB;	//PB2输出低
	BCR	_PORTB,2
	.line	75, "main.c"; 	break;
	LGOTO	_00137_DS_
_00130_DS_:
	.line	77, "main.c"; 	PORTB |= 0x10;
	BSR	_PORTB,4
	.line	78, "main.c"; 	if(count == 200)
	MOVR	_count,W
	XORIA	0xc8
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	MOVR	(_count + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	.line	79, "main.c"; 	PORTB &= 0xFB;	//PB2输出低
	BCR	_PORTB,2
	.line	80, "main.c"; 	break;
	LGOTO	_00137_DS_
_00133_DS_:
	.line	82, "main.c"; 	PORTB |= 0x02;
	BSR	_PORTB,1
	.line	83, "main.c"; 	if(count == 100)
	MOVR	_count,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	MOVR	(_count + 1),W
	XORIA	0x00
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	.line	84, "main.c"; 	PORTB &= 0xFB;	//PB2输出低
	BCR	_PORTB,2
	.line	85, "main.c"; 	break;
	LGOTO	_00137_DS_
_00136_DS_:
	.line	87, "main.c"; 	PORTB |= 0x04;	//PB2输出为高
	BSR	_PORTB,2
_00137_DS_:
	.line	91, "main.c"; 	if(workStep > 0 && workStep < 4)
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00143_DS_
;;unsigned compare: left < lit (0x4=4), size=1
	MOVIA	0x04
	SUBAR	_workStep,W
	BTRSC	STATUS,0
	LGOTO	_00143_DS_
	.line	93, "main.c"; 	if(++count == 400)
	INCR	_count,F
	BTRSC	STATUS,2
	INCR	(_count + 1),F
	MOVR	_count,W
	XORIA	0x90
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	MOVR	(_count + 1),W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00143_DS_
	.line	95, "main.c"; 	count = 0;
	CLRR	_count
	CLRR	(_count + 1)
	.line	96, "main.c"; 	PORTB |= 0x04;	//PB2输出为高
	BSR	_PORTB,2
_00143_DS_:
	.line	99, "main.c"; 	}
	RETURN	
; exit point of _outCon


;	code size estimation:
;	  330+    0 =   330 instructions (  660 byte)

	end
