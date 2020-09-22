;--------------------------------------------------------
; File Created by SDCC : free open source ANSI-C Compiler
; Version 3.7.1 #0 (MSVC)
;--------------------------------------------------------
; NY8A port
;--------------------------------------------------------
	.file	"main.c"
	list	p=NY8B062D,c=on
	#include "ny8b062d.inc"
	.debuginfo language C89
;--------------------------------------------------------
; external declarations
;--------------------------------------------------------
	extern	___uchar2fs
	extern	___schar2fs
	extern	___uint2fs
	extern	___sint2fs
	extern	___ulong2fs
	extern	___slong2fs
	extern	___fs2uchar
	extern	___fs2schar
	extern	___fs2uint
	extern	___fs2sint
	extern	___fs2ulong
	extern	___fs2slong
	extern	___fsadd
	extern	___fssub
	extern	___fsmul
	extern	___fsdiv
	extern	___fslt
	extern	___fseq
	extern	___fsneq
	extern	___fsgt
	extern	_msa_init
	extern	_msa_read_data
	extern	_msa_get_step
	extern	_msa_register_read_continuously
	extern	_i2c_write_byte_data
	extern	_msa_WriteBytes
	extern	_msa_calibrate
	extern	_msa_calibrateZ
	extern	_msa_ReadBytes
	extern	_SW_i2c_udelay
	extern	_msa_read_adc
	extern	_msa_flip_init
	extern	_msa_flip_process
	extern	_msa_sqrt
	extern	_Delay1000Us
	extern	_Delay10Us
	extern	_IIC_Start
	extern	_IIC_Send_Byte
	extern	_IIC_Read_Byte
	extern	_SDA_OUT
	extern	_SDA_IN
	extern	_IIC_Ack
	extern	_IIC_NAck
	extern	_delay_us
	extern	_delay_ms
	extern	_IIC_Stop
	extern	_IIC_Wait_Ack
	extern	_PORTAbits
	extern	_PORTBbits
	extern	_PCONbits
	extern	_BWUCONbits
	extern	_ABPLCONbits
	extern	_BPHCONbits
	extern	_INTEbits
	extern	_INTFbits
	extern	_ADMDbits
	extern	_ADRbits
	extern	_ADVREFHbits
	extern	_ADCRbits
	extern	_AWUCONbits
	extern	_PACONbits
	extern	_INTEDGbits
	extern	_ANAENbits
	extern	_RFCbits
	extern	_INTE2bits
	extern	_offset_z
	extern	_isCalibrated
	extern	_INDF
	extern	_TMR0
	extern	_PCL
	extern	_STATUS
	extern	_FSR
	extern	_PORTA
	extern	_PORTB
	extern	_PCON
	extern	_BWUCON
	extern	_PCHBUF
	extern	_ABPLCON
	extern	_BPHCON
	extern	_INTE
	extern	_INTF
	extern	_ADMD
	extern	_ADR
	extern	_ADD
	extern	_ADVREFH
	extern	_ADCR
	extern	_AWUCON
	extern	_PACON
	extern	_INTEDG
	extern	_TMRH
	extern	_ANAEN
	extern	_RFC
	extern	_TM3RH
	extern	_INTE2
	extern	_TMR1
	extern	_T1CR1
	extern	_T1CR2
	extern	_PWM1DUTY
	extern	_PS1CV
	extern	_BZ1CR
	extern	_IRCR
	extern	_TBHP
	extern	_TBHD
	extern	_TMR2
	extern	_T2CR1
	extern	_T2CR2
	extern	_PWM2DUTY
	extern	_PS2CV
	extern	_BZ2CR
	extern	_OSCCR
	extern	_TMR3
	extern	_T3CR1
	extern	_T3CR2
	extern	_PWM3DUTY
	extern	_PS3CV
	extern	_BZ3CR
	extern	_IOSTA
	extern	_IOSTB
	extern	_APHCON
	extern	_PS0CV
	extern	_BODCON
	extern	_CMPCR
	extern	_PCON1
	extern	_T0MD
	extern	___sdcc_saved_fsr
	extern	___sdcc_saved_stk00
	extern	___sdcc_saved_stk01
	extern	__gptrget1
	extern	__nyc_ny8_startup
;--------------------------------------------------------
; global declarations
;--------------------------------------------------------
	extern	_gotoSleep
	extern	_keyRead
	extern	_ind_light_disp
	extern	_getData
	extern	_chrgCtr
	extern	_refreshLed
	extern	_workCtr
	extern	_isr
	extern	_main
	extern	_hzH
	extern	_hzL
	extern	_hz
	extern	_chrgStep
	extern	_intCount
	extern	_IntFlag
	extern	_keyCount
	extern	_workStep
	extern	_baiwei
	extern	_shiwei
	extern	_gewei
	extern	_rockStep
	extern	_workTime
	extern	_sleepTime
	extern	_rockTime
	extern	_checkTime

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

.segment "uninit", 0x20000040
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
.segment "uninit"
_hzH:
	.res	1
	.debuginfo gvariable name=_hzH,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_hzL:
	.res	1
	.debuginfo gvariable name=_hzL,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_baiwei:
	.res	1
	.debuginfo gvariable name=_baiwei,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_shiwei:
	.res	1
	.debuginfo gvariable name=_shiwei,1byte,array=0,entsize=1,ext=1

.segment "uninit"
_gewei:
	.res	1
	.debuginfo gvariable name=_gewei,1byte,array=0,entsize=1,ext=1

;--------------------------------------------------------
; absolute symbol definitions
;--------------------------------------------------------
;--------------------------------------------------------
; compiler-defined variables
;--------------------------------------------------------
.segment "uninit"
r0x102D:
	.res	1
.segment "uninit"
r0x102A:
	.res	1
.segment "uninit"
r0x102B:
	.res	1
.segment "uninit"
r0x102C:
	.res	1
.segment "uninit"
r0x1029:
	.res	1
.segment "uninit"
r0x1026:
	.res	1
.segment "uninit"
r0x1025:
	.res	1
.segment "uninit"
r0x1027:
	.res	1
.segment "uninit"
r0x1028:
	.res	1
.segment "uninit"
r0x1023:
	.res	1
.segment "uninit"
r0x1024:
	.res	1
.segment "uninit"
r0x1022:
	.res	1
;--------------------------------------------------------
; initialized data
;--------------------------------------------------------

.segment "idata"
_hz:
	dw	0x00, 0x00
	.debuginfo gvariable name=_hz,2byte,array=0,entsize=2,ext=1


.segment "idata"
_chrgStep:
	dw	0x00
	.debuginfo gvariable name=_chrgStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_intCount:
	dw	0x00
	.debuginfo gvariable name=_intCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_IntFlag:
	dw	0x00
	.debuginfo gvariable name=_IntFlag,1byte,array=0,entsize=1,ext=1


.segment "idata"
_keyCount:
	dw	0x00
	.debuginfo gvariable name=_keyCount,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workStep:
	dw	0x00
	.debuginfo gvariable name=_workStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_rockStep:
	dw	0x00
	.debuginfo gvariable name=_rockStep,1byte,array=0,entsize=1,ext=1


.segment "idata"
_workTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_workTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_sleepTime:
	dw	0x00, 0x00
	.debuginfo gvariable name=_sleepTime,2byte,array=0,entsize=2,ext=1


.segment "idata"
_rockTime:
	dw	0x00
	.debuginfo gvariable name=_rockTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_checkTime:
	dw	0x00
	.debuginfo gvariable name=_checkTime,1byte,array=0,entsize=1,ext=1


.segment "idata"
_table:
	dw	0x3f
	dw	0x06
	dw	0x5b
	dw	0x4f
	dw	0x66
	dw	0x6d
	dw	0x7d
	dw	0x07
	dw	0x7f
	dw	0x6f
	dw	0x71
	dw	0x38
	.debuginfo gvariable name=_table,12byte,array=1,entsize=1,ext=0

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
	.line	36, "main.c"; 	void isr(void) __interrupt(0)
	MOVAR	WSAVE
	SWAPR	STATUS,W
	CLRR	STATUS
	MOVAR	SSAVE
	MOVR	PCHBUF,W
	CLRR	PCHBUF
	MOVAR	PSAVE
	MOVR	FSR,W
	BANKSEL	___sdcc_saved_fsr
	MOVAR	___sdcc_saved_fsr
	MOVR	STK00,W
	BANKSEL	___sdcc_saved_stk00
	MOVAR	___sdcc_saved_stk00
	MOVR	STK01,W
	BANKSEL	___sdcc_saved_stk01
	MOVAR	___sdcc_saved_stk01
	.line	38, "main.c"; 	if(INTFbits.T0IF)
	BTRSS	_INTFbits,0
	LGOTO	_00108_DS_
	.line	40, "main.c"; 	TMR0 += 55;
	MOVIA	0x37
	ADDAR	_TMR0,F
	.line	41, "main.c"; 	intCount++;
	BANKSEL	_intCount
	INCR	_intCount,F
	.line	42, "main.c"; 	if(intCount == 100)
	MOVR	_intCount,W
	XORIA	0x64
	BTRSS	STATUS,2
	LGOTO	_00108_DS_
	.line	44, "main.c"; 	intCount = 0;
	CLRR	_intCount
	.line	45, "main.c"; 	IntFlag = 1;
	MOVIA	0x01
	BANKSEL	_IntFlag
	MOVAR	_IntFlag
_00108_DS_:
	.line	48, "main.c"; 	if(INTFbits.PABIF)
	BTRSS	_INTFbits,1
	LGOTO	_00110_DS_
	.line	50, "main.c"; 	INTF= (unsigned char)~(C_INT_PABKey);	// Clear PABIF(PortB input change interrupt flag bit)		
	MOVIA	0xfd
	MOVAR	_INTF
_00110_DS_:
	.line	53, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	55, "main.c"; 	}
	BANKSEL	___sdcc_saved_stk01
	MOVR	___sdcc_saved_stk01,W
	MOVAR	STK01
	BANKSEL	___sdcc_saved_stk00
	MOVR	___sdcc_saved_stk00,W
	MOVAR	STK00
	BANKSEL	___sdcc_saved_fsr
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
;   _msa_init
;   _refreshLed
;   _keyRead
;   _chrgCtr
;   _workCtr
;   _getData
;   _gotoSleep
;   _msa_init
;   _refreshLed
;   _keyRead
;   _chrgCtr
;   _workCtr
;   _getData
;   _gotoSleep
;1 compiler assigned register :
;   r0x102D
;; Starting pCode block
.segment "code"; module=main, function=_main
	.debuginfo subprogram _main
_main:
; 2 exit points
	.line	62, "main.c"; 	APHCON = 0xBF;
	MOVIA	0xbf
	IOST	_APHCON
	.line	63, "main.c"; 	IOSTA = 0x00;     // Set PB0 & PB1 to input mode,others set to output mode
	CLRA	
	IOST	_IOSTA
	.line	64, "main.c"; 	IOSTB = 0x00;
	IOST	_IOSTB
	.line	65, "main.c"; 	PORTA = 0x00; 
	CLRR	_PORTA
	.line	66, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
	CLRR	_PORTB
	.line	67, "main.c"; 	msa_init();
	LCALL	_msa_init
	.line	68, "main.c"; 	IOSTA = C_PA0_Input | C_PA3_Input | C_PA4_Input;     // Set PB0 & PB1 to input mode,others set to output mode
	MOVIA	0x19
	IOST	_IOSTA
	.line	69, "main.c"; 	IOSTB = 0x00;
	CLRA	
	IOST	_IOSTB
	.line	70, "main.c"; 	APHCON = 0xAE;		//CHRG	PA4 拉高
	MOVIA	0xae
	IOST	_APHCON
	.line	71, "main.c"; 	BPHCON = 0xFF;		
	MOVIA	0xff
	MOVAR	_BPHCON
	.line	72, "main.c"; 	ABPLCON = 0xF7;		//  USB PA3	拉低
	MOVIA	0xf7
	MOVAR	_ABPLCON
	.line	73, "main.c"; 	PORTA = 0x00; 
	CLRR	_PORTA
	.line	74, "main.c"; 	PORTB = 0x00;                           // PB0、PB1 & PB2 are output High	
	CLRR	_PORTB
	.line	75, "main.c"; 	PCON = C_WDT_En | C_LVR_En | C_LVD_En;				// Enable WDT & LVR
	MOVIA	0xa8
	MOVAR	_PCON
	.line	77, "main.c"; 	PCON1 = C_TMR0_Dis;
	CLRA	
	IOST	_PCON1
	.line	79, "main.c"; 	TMR0 = 55;
	MOVIA	0x37
	MOVAR	_TMR0
	.line	80, "main.c"; 	T0MD =  C_PS0_TMR0 | C_PS0_Div2;
	CLRA	
	T0MD	
	.line	81, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	82, "main.c"; 	PCON1 = C_TMR0_En;
	MOVIA	0x01
	IOST	_PCON1
	.line	83, "main.c"; 	ENI();
	ENI
	.line	84, "main.c"; 	baiwei = shiwei = gewei = 0;
	BANKSEL	_gewei
	CLRR	_gewei
	BANKSEL	_shiwei
	CLRR	_shiwei
	BANKSEL	_baiwei
	CLRR	_baiwei
	.line	85, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
_00137_DS_:
	.line	88, "main.c"; 	CLRWDT();			//Clear WDT, this function is defined in ny8command.h
	clrwdt
	.line	90, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	.line	92, "main.c"; 	refreshLed();
	LCALL	_refreshLed
	.line	94, "main.c"; 	if(!IntFlag)
	BANKSEL	_IntFlag
	MOVR	_IntFlag,W
	BTRSC	STATUS,2
	LGOTO	_00137_DS_
	.line	96, "main.c"; 	IntFlag = 0;
	CLRR	_IntFlag
	.line	97, "main.c"; 	if(keyRead(0x01 & (~PORTA)))
	COMR	_PORTA,W
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVIA	0x01
	ANDAR	r0x102D,F
	MOVR	r0x102D,W
	LCALL	_keyRead
	BANKSEL	r0x102D
	MOVAR	r0x102D
	MOVR	r0x102D,W
	BTRSC	STATUS,2
	LGOTO	_00123_DS_
	.line	99, "main.c"; 	if(workStep)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSC	STATUS,2
	LGOTO	_00120_DS_
	.line	101, "main.c"; 	workStep = 0;
	CLRR	_workStep
	.line	102, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	103, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
	LGOTO	_00123_DS_
_00120_DS_:
	.line	107, "main.c"; 	workStep = 1;
	MOVIA	0x01
	BANKSEL	_workStep
	MOVAR	_workStep
	.line	108, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	109, "main.c"; 	rockStep = 1;
	MOVIA	0x01
	BANKSEL	_rockStep
	MOVAR	_rockStep
_00123_DS_:
	.line	113, "main.c"; 	chrgCtr();
	LCALL	_chrgCtr
	.line	114, "main.c"; 	workCtr();
	LCALL	_workCtr
	.line	115, "main.c"; 	if(rockStep == 0 && workStep == 1)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	BANKSEL	_workStep
	MOVR	_workStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00127_DS_
	.line	117, "main.c"; 	getData();
	LCALL	_getData
	.line	118, "main.c"; 	if(++checkTime >= 200)
	BANKSEL	_checkTime
	INCR	_checkTime,F
;;unsigned compare: left < lit (0xC8=200), size=1
	MOVIA	0xc8
	SUBAR	_checkTime,W
	BTRSS	STATUS,0
	LGOTO	_00127_DS_
	.line	120, "main.c"; 	checkTime = 0;
	CLRR	_checkTime
	.line	121, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
_00127_DS_:
	.line	124, "main.c"; 	if(workStep == 0 && rockStep == 0 && keyCount== 0 && rockTime == 0)
	BANKSEL	_workStep
	MOVR	_workStep,W
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	BANKSEL	_keyCount
	MOVR	_keyCount,W
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	BANKSEL	_rockTime
	MOVR	_rockTime,W
	BTRSS	STATUS,2
	LGOTO	_00137_DS_
	.line	126, "main.c"; 	if(++sleepTime > 100)
	BANKSEL	_sleepTime
	INCR	_sleepTime,F
	BTRSC	STATUS,2
	INCR	(_sleepTime + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x65=101), size=2
	MOVIA	0x00
	SUBAR	(_sleepTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00181_DS_
	MOVIA	0x65
	SUBAR	_sleepTime,W
_00181_DS_:
	BTRSS	STATUS,0
	LGOTO	_00137_DS_
	.line	127, "main.c"; 	gotoSleep();
	LCALL	_gotoSleep
	LGOTO	_00137_DS_
	.line	130, "main.c"; 	}
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
	.line	362, "main.c"; 	COM1 = 1;
	BSR	_PORTA,7
	.line	363, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	364, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	365, "main.c"; 	baiwei = shiwei = gewei = 0;
	BANKSEL	_gewei
	CLRR	_gewei
	BANKSEL	_shiwei
	CLRR	_shiwei
	BANKSEL	_baiwei
	CLRR	_baiwei
	.line	366, "main.c"; 	workStep = 0;
	BANKSEL	_workStep
	CLRR	_workStep
	.line	367, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	368, "main.c"; 	AWUCON = 0x19;
	MOVIA	0x19
	MOVAR	_AWUCON
	.line	369, "main.c"; 	sleepTime = 0;	
	BANKSEL	_sleepTime
	CLRR	_sleepTime
	CLRR	(_sleepTime + 1)
	.line	370, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;
	MOVIA	0x03
	MOVAR	_INTE
	.line	371, "main.c"; 	PCON =  C_LVR_En;	
	MOVIA	0x08
	MOVAR	_PCON
	.line	372, "main.c"; 	INTF = 0;								// Clear all interrupt flags
	CLRR	_INTF
	.line	373, "main.c"; 	CLRWDT();
	clrwdt
	.line	374, "main.c"; 	ENI();
	ENI
	.line	375, "main.c"; 	SLEEP();
	sleep
	.line	376, "main.c"; 	AWUCON = 0x00;
	CLRR	_AWUCON
	.line	377, "main.c"; 	INTE =  C_INT_TMR0 | C_INT_PABKey;	// Enable Timer0、Timer1、WDT overflow interrupt
	MOVIA	0x03
	MOVAR	_INTE
	.line	378, "main.c"; 	INTF = 0;
	CLRR	_INTF
	.line	383, "main.c"; 	}
	RETURN	
; exit point of _gotoSleep

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;1 compiler assigned register :
;   r0x1022
;; Starting pCode block
.segment "code"; module=main, function=_keyRead
	.debuginfo subprogram _keyRead
;local variable name mapping:
	.debuginfo variable _KeyStatus=r0x1022
_keyRead:
; 2 exit points
	.line	338, "main.c"; 	char keyRead(char KeyStatus)	
	BANKSEL	r0x1022
	MOVAR	r0x1022
	.line	340, "main.c"; 	if (KeyStatus)
	MOVR	r0x1022,W
	BTRSC	STATUS,2
	LGOTO	_00487_DS_
	.line	342, "main.c"; 	keyCount++;
	BANKSEL	_keyCount
	INCR	_keyCount,F
;;unsigned compare: left < lit (0xC8=200), size=1
	.line	343, "main.c"; 	if(keyCount >= 200)
	MOVIA	0xc8
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00488_DS_
	.line	345, "main.c"; 	keyCount = 200;
	MOVIA	0xc8
	MOVAR	_keyCount
	LGOTO	_00488_DS_
;;unsigned compare: left < lit (0x8=8), size=1
_00487_DS_:
	.line	350, "main.c"; 	if(keyCount >= 8)
	MOVIA	0x08
	BANKSEL	_keyCount
	SUBAR	_keyCount,W
	BTRSS	STATUS,0
	LGOTO	_00485_DS_
	.line	352, "main.c"; 	keyCount = 0;
	CLRR	_keyCount
	.line	353, "main.c"; 	return	1;
	MOVIA	0x01
	LGOTO	_00489_DS_
_00485_DS_:
	.line	355, "main.c"; 	keyCount = 0;
	BANKSEL	_keyCount
	CLRR	_keyCount
_00488_DS_:
	.line	357, "main.c"; 	return 0;
	MOVIA	0x00
_00489_DS_:
	.line	358, "main.c"; 	}
	RETURN	
; exit point of _keyRead

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;   _Delay10Us
;2 compiler assigned registers:
;   r0x1023
;   r0x1024
;; Starting pCode block
.segment "code"; module=main, function=_ind_light_disp
	.debuginfo subprogram _ind_light_disp
;local variable name mapping:
	.debuginfo variable _udata=r0x1023
	.debuginfo variable _Count0=r0x1024
_ind_light_disp:
; 2 exit points
	.line	313, "main.c"; 	void ind_light_disp( uint8_t udata )
	BANKSEL	r0x1023
	MOVAR	r0x1023
	.line	316, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x1024
	CLRR	r0x1024
_00477_DS_:
	.line	318, "main.c"; 	CLK=0;
	BCR	_PORTB,0
	.line	319, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	320, "main.c"; 	if(udata&0x80)
	BANKSEL	r0x1023
	BTRSS	r0x1023,7
	LGOTO	_00474_DS_
	.line	322, "main.c"; 	DAT=1;
	BSR	_PORTA,1
	.line	323, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	LGOTO	_00475_DS_
_00474_DS_:
	.line	327, "main.c"; 	DAT=0;
	BCR	_PORTA,1
	.line	328, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
_00475_DS_:
	.line	330, "main.c"; 	CLK=1;
	BSR	_PORTB,0
	.line	331, "main.c"; 	Delay10Us();
	LCALL	_Delay10Us
	.line	332, "main.c"; 	udata<<=1;
	BCR	STATUS,0
	BANKSEL	r0x1023
	RLR	r0x1023,F
	.line	316, "main.c"; 	for(Count0=0;Count0<=7;Count0++)
	BANKSEL	r0x1024
	INCR	r0x1024,F
;;swapping arguments (AOP_TYPEs 1/2)
;;unsigned compare: left >= lit (0x8=8), size=1
	MOVIA	0x08
	SUBAR	r0x1024,W
	BTRSS	STATUS,0
	LGOTO	_00477_DS_
	.line	334, "main.c"; 	CLK=0;
	BCR	_PORTB,0
	.line	335, "main.c"; 	DAT=0;
	BCR	_PORTA,1
	.line	336, "main.c"; 	}
	RETURN	
; exit point of _ind_light_disp

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _msa_ReadBytes
;   _msa_ReadBytes
;   _msa_ReadBytes
;   _msa_ReadBytes
;7 compiler assigned registers:
;   r0x1025
;   r0x1026
;   r0x1027
;   STK02
;   STK01
;   STK00
;   r0x1028
;; Starting pCode block
.segment "code"; module=main, function=_getData
	.debuginfo subprogram _getData
_getData:
; 2 exit points
	.line	289, "main.c"; 	msa_ReadBytes(&hzL,MSA_REG_ACC_Z_LSB);
	MOVIA	((_hzL + 0) >> 8) & 0xff
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVIA	(_hzL + 0)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1027
	CLRR	r0x1027
	MOVIA	0x06
	MOVAR	STK02
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK01
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	290, "main.c"; 	msa_ReadBytes(&hzH,MSA_REG_ACC_Z_MSB);
	MOVIA	((_hzH + 0) >> 8) & 0xff
	BANKSEL	r0x1025
	MOVAR	r0x1025
	MOVIA	(_hzH + 0)
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1027
	CLRR	r0x1027
	MOVIA	0x07
	MOVAR	STK02
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	MOVAR	STK01
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_msa_ReadBytes
	.line	292, "main.c"; 	hz = ((short)(hzH << 8 | hzL))>> 4;
	BANKSEL	_hzH
	MOVR	_hzH,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	r0x1026
	BTRSS	r0x1026,7
	LGOTO	_00001_DS_
	BANKSEL	r0x1025
	DECR	r0x1025,F
_00001_DS_:
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1028
	MOVAR	r0x1028
	BANKSEL	r0x1027
	CLRR	r0x1027
	BANKSEL	_hzL
	MOVR	_hzL,W
	BANKSEL	r0x1026
	MOVAR	r0x1026
	BANKSEL	r0x1025
	CLRR	r0x1025
	BANKSEL	r0x1026
	BTRSS	r0x1026,7
	LGOTO	_00002_DS_
	BANKSEL	r0x1025
	DECR	r0x1025,F
_00002_DS_:
	BANKSEL	r0x1026
	MOVR	r0x1026,W
	BANKSEL	r0x1027
	IORAR	r0x1027,F
	BANKSEL	r0x1025
	MOVR	r0x1025,W
	BANKSEL	r0x1028
	IORAR	r0x1028,F
	BANKSEL	r0x1027
	SWAPR	r0x1027,W
	ANDIA	0x0f
	BANKSEL	_hz
	MOVAR	_hz
	BANKSEL	r0x1028
	SWAPR	r0x1028,W
	BANKSEL	_hz
	MOVAR	(_hz + 1)
	ANDIA	0xf0
	IORAR	_hz,F
	XORAR	(_hz + 1),F
	MOVIA	0xf0
	BTRSC	(_hz + 1),3
	IORAR	(_hz + 1),F
	.line	293, "main.c"; 	hz &= 0x0FFF;
	MOVIA	0x0f
	ANDAR	(_hz + 1),F
;;swapping arguments (AOP_TYPEs 1/3)
;;unsigned compare: left >= lit (0x1C1=449), size=2
	.line	294, "main.c"; 	if(hz > 0x1C0 && hz < 0xE40)
	MOVIA	0x01
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00467_DS_
	MOVIA	0xc1
	SUBAR	_hz,W
_00467_DS_:
	BTRSS	STATUS,0
	LGOTO	_00453_DS_
;;unsigned compare: left < lit (0xE40=3648), size=2
	MOVIA	0x0e
	BANKSEL	_hz
	SUBAR	(_hz + 1),W
	BTRSS	STATUS,2
	LGOTO	_00468_DS_
	MOVIA	0x40
	SUBAR	_hz,W
_00468_DS_:
	BTRSC	STATUS,0
	LGOTO	_00453_DS_
	.line	296, "main.c"; 	if(++rockTime >= 20)
	BANKSEL	_rockTime
	INCR	_rockTime,F
;;unsigned compare: left < lit (0x14=20), size=1
	MOVIA	0x14
	SUBAR	_rockTime,W
	BTRSS	STATUS,0
	LGOTO	_00450_DS_
	.line	298, "main.c"; 	rockStep = 2;
	MOVIA	0x02
	BANKSEL	_rockStep
	MOVAR	_rockStep
	.line	299, "main.c"; 	workTime = 0;
	BANKSEL	_workTime
	CLRR	_workTime
	CLRR	(_workTime + 1)
	.line	300, "main.c"; 	rockTime = 0;
	BANKSEL	_rockTime
	CLRR	_rockTime
	.line	301, "main.c"; 	return 1;
	MOVIA	0x01
	LGOTO	_00456_DS_
_00450_DS_:
	.line	304, "main.c"; 	return 0;
	MOVIA	0x00
	LGOTO	_00456_DS_
_00453_DS_:
	.line	308, "main.c"; 	return 0;
	MOVIA	0x00
_00456_DS_:
	.line	310, "main.c"; 	}
	RETURN	
; exit point of _getData

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ind_light_disp
;   _ind_light_disp
;   _ind_light_disp
;   _ind_light_disp
;1 compiler assigned register :
;   r0x1029
;; Starting pCode block
.segment "code"; module=main, function=_chrgCtr
	.debuginfo subprogram _chrgCtr
_chrgCtr:
; 2 exit points
	.line	262, "main.c"; 	if(PORTA & 0x08)
	BTRSS	_PORTA,3
	LGOTO	_00442_DS_
	.line	265, "main.c"; 	workStep = 0;	//充电中不能使用
	BANKSEL	_workStep
	CLRR	_workStep
	.line	266, "main.c"; 	COM1 = COM2 = COM3 = 1;
	BSR	_PORTB,1
	BTRSS	_PORTB,1
	BCR	_PORTA,6
	BTRSC	_PORTB,1
	BSR	_PORTA,6
	BTRSS	_PORTA,6
	BCR	_PORTA,7
	BTRSC	_PORTA,6
	BSR	_PORTA,7
	.line	267, "main.c"; 	if(PORTA & 0x10)
	BTRSS	_PORTA,4
	LGOTO	_00439_DS_
	.line	270, "main.c"; 	chrgStep = 2;
	MOVIA	0x02
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	271, "main.c"; 	ind_light_disp(table[10]);
	BANKSEL	_table
	MOVR	(_table + 10),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	LCALL	_ind_light_disp
	LGOTO	_00444_DS_
_00439_DS_:
	.line	275, "main.c"; 	chrgStep = 1;
	MOVIA	0x01
	BANKSEL	_chrgStep
	MOVAR	_chrgStep
	.line	276, "main.c"; 	ind_light_disp(table[11]);
	BANKSEL	_table
	MOVR	(_table + 11),W
	BANKSEL	r0x1029
	MOVAR	r0x1029
	LCALL	_ind_light_disp
	LGOTO	_00444_DS_
_00442_DS_:
	.line	281, "main.c"; 	chrgStep = 0;
	BANKSEL	_chrgStep
	CLRR	_chrgStep
_00444_DS_:
	.line	283, "main.c"; 	}
	RETURN	
; exit point of _chrgCtr

;***
;  pBlock Stats: dbName = C
;***
;has an exit
;functions called:
;   _ind_light_disp
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   _ind_light_disp
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;   __gptrget1
;   _ind_light_disp
;   _delay_us
;5 compiler assigned registers:
;   r0x102A
;   r0x102B
;   STK01
;   STK00
;   r0x102C
;; Starting pCode block
.segment "code"; module=main, function=_refreshLed
	.debuginfo subprogram _refreshLed
_refreshLed:
; 2 exit points
	.line	230, "main.c"; 	ind_light_disp(0);
	MOVIA	0x00
	LCALL	_ind_light_disp
	.line	231, "main.c"; 	COM1 = 1;
	BSR	_PORTA,7
	.line	232, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	233, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	234, "main.c"; 	ind_light_disp(table[baiwei]);
	BANKSEL	_baiwei
	MOVR	_baiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x102C
	MOVAR	r0x102C
	LCALL	_ind_light_disp
	.line	235, "main.c"; 	COM1 = 0;
	BCR	_PORTA,7
	.line	236, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	237, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	238, "main.c"; 	delay_us(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	239, "main.c"; 	COM1 = 1;
	BSR	_PORTA,7
	.line	240, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	241, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	242, "main.c"; 	ind_light_disp(table[shiwei]);
	BANKSEL	_shiwei
	MOVR	_shiwei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x102C
	MOVAR	r0x102C
	LCALL	_ind_light_disp
	.line	243, "main.c"; 	COM1 = 1;
	BSR	_PORTA,7
	.line	244, "main.c"; 	COM2 = 0;
	BCR	_PORTA,6
	.line	245, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	246, "main.c"; 	delay_us(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	247, "main.c"; 	COM1 = 1;
	BSR	_PORTA,7
	.line	248, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	249, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	250, "main.c"; 	ind_light_disp(table[gewei]);
	BANKSEL	_gewei
	MOVR	_gewei,W
	ADDIA	(_table + 0)
	BANKSEL	r0x102A
	MOVAR	r0x102A
	MOVIA	((_table + 0) >> 8) & 0xff
	BTRSC	STATUS,0
	ADDIA	0x01
	BANKSEL	r0x102B
	MOVAR	r0x102B
	BANKSEL	r0x102A
	MOVR	r0x102A,W
	MOVAR	STK01
	BANKSEL	r0x102B
	MOVR	r0x102B,W
	MOVAR	STK00
	MOVIA	0x00
	LCALL	__gptrget1
	BANKSEL	r0x102C
	MOVAR	r0x102C
	LCALL	_ind_light_disp
	.line	251, "main.c"; 	COM1 = 1;
	BSR	_PORTA,7
	.line	252, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	253, "main.c"; 	COM3 = 0;
	BCR	_PORTB,1
	.line	254, "main.c"; 	delay_us(100);
	MOVIA	0x64
	MOVAR	STK00
	MOVIA	0x00
	LCALL	_delay_us
	.line	255, "main.c"; 	COM1 = 1;
	BSR	_PORTA,7
	.line	256, "main.c"; 	COM2 = 1;
	BSR	_PORTA,6
	.line	257, "main.c"; 	COM3 = 1;
	BSR	_PORTB,1
	.line	258, "main.c"; 	}
	RETURN	
; exit point of _refreshLed

;***
;  pBlock Stats: dbName = C
;***
;; Starting pCode block
.segment "code"; module=main, function=_workCtr
	.debuginfo subprogram _workCtr
_workCtr:
; 0 exit points
	.line	134, "main.c"; 	if(rockStep == 1)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	XORIA	0x01
	BTRSS	STATUS,2
	LGOTO	_00287_DS_
	.line	136, "main.c"; 	++workTime;
	BANKSEL	_workTime
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x18=24), size=2
	.line	137, "main.c"; 	if(workTime < 24)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00399_DS_
	MOVIA	0x18
	SUBAR	_workTime,W
_00399_DS_:
	BTRSC	STATUS,0
	LGOTO	_00205_DS_
	.line	138, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x2D=45), size=2
_00205_DS_:
	.line	139, "main.c"; 	else if(workTime < 45)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00400_DS_
	MOVIA	0x2d
	SUBAR	_workTime,W
_00400_DS_:
	BTRSC	STATUS,0
	LGOTO	_00202_DS_
	.line	140, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x44=68), size=2
_00202_DS_:
	.line	141, "main.c"; 	else if(workTime < 68)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00401_DS_
	MOVIA	0x44
	SUBAR	_workTime,W
_00401_DS_:
	BTRSC	STATUS,0
	LGOTO	_00199_DS_
	.line	142, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x59=89), size=2
_00199_DS_:
	.line	143, "main.c"; 	else if(workTime < 89)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00402_DS_
	MOVIA	0x59
	SUBAR	_workTime,W
_00402_DS_:
	BTRSC	STATUS,0
	LGOTO	_00196_DS_
	.line	144, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x6F=111), size=2
_00196_DS_:
	.line	145, "main.c"; 	else if(workTime < 111)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00403_DS_
	MOVIA	0x6f
	SUBAR	_workTime,W
_00403_DS_:
	BTRSC	STATUS,0
	LGOTO	_00193_DS_
	.line	146, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x8E=142), size=2
_00193_DS_:
	.line	147, "main.c"; 	else if(workTime < 142)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00404_DS_
	MOVIA	0x8e
	SUBAR	_workTime,W
_00404_DS_:
	BTRSC	STATUS,0
	LGOTO	_00190_DS_
	.line	148, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0xAE=174), size=2
_00190_DS_:
	.line	149, "main.c"; 	else if(workTime < 174)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00405_DS_
	MOVIA	0xae
	SUBAR	_workTime,W
_00405_DS_:
	BTRSC	STATUS,0
	LGOTO	_00187_DS_
	.line	150, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
_00187_DS_:
	.line	153, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	.line	154, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	LGOTO	_00289_DS_
_00287_DS_:
	.line	157, "main.c"; 	else if(rockStep == 2)
	BANKSEL	_rockStep
	MOVR	_rockStep,W
	XORIA	0x02
	BTRSS	STATUS,2
	LGOTO	_00289_DS_
	.line	159, "main.c"; 	++workTime;
	BANKSEL	_workTime
	INCR	_workTime,F
	BTRSC	STATUS,2
	INCR	(_workTime + 1),F
;;unsigned compare: left < lit (0x4F=79), size=2
	.line	160, "main.c"; 	if(workTime < 79)
	MOVIA	0x00
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00406_DS_
	MOVIA	0x4f
	SUBAR	_workTime,W
_00406_DS_:
	BTRSC	STATUS,0
	LGOTO	_00208_DS_
	.line	161, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
;;unsigned compare: left < lit (0x5A=90), size=2
_00208_DS_:
	.line	162, "main.c"; 	if(workTime < 90)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00407_DS_
	MOVIA	0x5a
	SUBAR	_workTime,W
_00407_DS_:
	BTRSC	STATUS,0
	LGOTO	_00282_DS_
	.line	163, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x5F=95), size=2
_00282_DS_:
	.line	164, "main.c"; 	else if(workTime < 95)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00408_DS_
	MOVIA	0x5f
	SUBAR	_workTime,W
_00408_DS_:
	BTRSC	STATUS,0
	LGOTO	_00279_DS_
	.line	165, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x70=112), size=2
_00279_DS_:
	.line	166, "main.c"; 	else if(workTime < 112)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00409_DS_
	MOVIA	0x70
	SUBAR	_workTime,W
_00409_DS_:
	BTRSC	STATUS,0
	LGOTO	_00276_DS_
	.line	167, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x73=115), size=2
_00276_DS_:
	.line	168, "main.c"; 	else if(workTime < 115)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00410_DS_
	MOVIA	0x73
	SUBAR	_workTime,W
_00410_DS_:
	BTRSC	STATUS,0
	LGOTO	_00273_DS_
	.line	169, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x81=129), size=2
_00273_DS_:
	.line	170, "main.c"; 	else if(workTime < 129)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00411_DS_
	MOVIA	0x81
	SUBAR	_workTime,W
_00411_DS_:
	BTRSC	STATUS,0
	LGOTO	_00270_DS_
	.line	171, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0xA4=164), size=2
_00270_DS_:
	.line	172, "main.c"; 	else if(workTime < 164)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00412_DS_
	MOVIA	0xa4
	SUBAR	_workTime,W
_00412_DS_:
	BTRSC	STATUS,0
	LGOTO	_00267_DS_
	.line	173, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0xAF=175), size=2
_00267_DS_:
	.line	174, "main.c"; 	else if(workTime < 175)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00413_DS_
	MOVIA	0xaf
	SUBAR	_workTime,W
_00413_DS_:
	BTRSC	STATUS,0
	LGOTO	_00264_DS_
	.line	175, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0xB4=180), size=2
_00264_DS_:
	.line	176, "main.c"; 	else if(workTime < 180)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00414_DS_
	MOVIA	0xb4
	SUBAR	_workTime,W
_00414_DS_:
	BTRSC	STATUS,0
	LGOTO	_00261_DS_
	.line	177, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0xC5=197), size=2
_00261_DS_:
	.line	178, "main.c"; 	else if(workTime < 197)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00415_DS_
	MOVIA	0xc5
	SUBAR	_workTime,W
_00415_DS_:
	BTRSC	STATUS,0
	LGOTO	_00258_DS_
	.line	179, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0xC8=200), size=2
_00258_DS_:
	.line	180, "main.c"; 	else if(workTime < 200)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00416_DS_
	MOVIA	0xc8
	SUBAR	_workTime,W
_00416_DS_:
	BTRSC	STATUS,0
	LGOTO	_00255_DS_
	.line	181, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0xD6=214), size=2
_00255_DS_:
	.line	182, "main.c"; 	else if(workTime < 214)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00417_DS_
	MOVIA	0xd6
	SUBAR	_workTime,W
_00417_DS_:
	BTRSC	STATUS,0
	LGOTO	_00252_DS_
	.line	183, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0xF9=249), size=2
_00252_DS_:
	.line	184, "main.c"; 	else if(workTime < 249)
	MOVIA	0x00
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00418_DS_
	MOVIA	0xf9
	SUBAR	_workTime,W
_00418_DS_:
	BTRSC	STATUS,0
	LGOTO	_00249_DS_
	.line	185, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x104=260), size=2
_00249_DS_:
	.line	186, "main.c"; 	else if(workTime < 260)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00419_DS_
	MOVIA	0x04
	SUBAR	_workTime,W
_00419_DS_:
	BTRSC	STATUS,0
	LGOTO	_00246_DS_
	.line	187, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x109=265), size=2
_00246_DS_:
	.line	188, "main.c"; 	else if(workTime < 265)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00420_DS_
	MOVIA	0x09
	SUBAR	_workTime,W
_00420_DS_:
	BTRSC	STATUS,0
	LGOTO	_00243_DS_
	.line	189, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x11A=282), size=2
_00243_DS_:
	.line	190, "main.c"; 	else if(workTime < 282)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00421_DS_
	MOVIA	0x1a
	SUBAR	_workTime,W
_00421_DS_:
	BTRSC	STATUS,0
	LGOTO	_00240_DS_
	.line	191, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x11D=285), size=2
_00240_DS_:
	.line	192, "main.c"; 	else if(workTime < 285)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00422_DS_
	MOVIA	0x1d
	SUBAR	_workTime,W
_00422_DS_:
	BTRSC	STATUS,0
	LGOTO	_00237_DS_
	.line	193, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x12C=300), size=2
_00237_DS_:
	.line	194, "main.c"; 	else if(workTime < 300)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00423_DS_
	MOVIA	0x2c
	SUBAR	_workTime,W
_00423_DS_:
	BTRSC	STATUS,0
	LGOTO	_00234_DS_
	.line	195, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x14D=333), size=2
_00234_DS_:
	.line	196, "main.c"; 	else if(workTime < 333)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00424_DS_
	MOVIA	0x4d
	SUBAR	_workTime,W
_00424_DS_:
	BTRSC	STATUS,0
	LGOTO	_00231_DS_
	.line	197, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x158=344), size=2
_00231_DS_:
	.line	198, "main.c"; 	else if(workTime < 344)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00425_DS_
	MOVIA	0x58
	SUBAR	_workTime,W
_00425_DS_:
	BTRSC	STATUS,0
	LGOTO	_00228_DS_
	.line	199, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x15E=350), size=2
_00228_DS_:
	.line	200, "main.c"; 	else if(workTime < 350)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00426_DS_
	MOVIA	0x5e
	SUBAR	_workTime,W
_00426_DS_:
	BTRSC	STATUS,0
	LGOTO	_00225_DS_
	.line	201, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x16E=366), size=2
_00225_DS_:
	.line	202, "main.c"; 	else if(workTime < 366)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00427_DS_
	MOVIA	0x6e
	SUBAR	_workTime,W
_00427_DS_:
	BTRSC	STATUS,0
	LGOTO	_00222_DS_
	.line	203, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x172=370), size=2
_00222_DS_:
	.line	204, "main.c"; 	else if(workTime < 370)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00428_DS_
	MOVIA	0x72
	SUBAR	_workTime,W
_00428_DS_:
	BTRSC	STATUS,0
	LGOTO	_00219_DS_
	.line	205, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	LGOTO	_00289_DS_
;;unsigned compare: left < lit (0x180=384), size=2
_00219_DS_:
	.line	206, "main.c"; 	else if(workTime < 384)
	MOVIA	0x01
	BANKSEL	_workTime
	SUBAR	(_workTime + 1),W
	BTRSS	STATUS,2
	LGOTO	_00429_DS_
	MOVIA	0x80
	SUBAR	_workTime,W
_00429_DS_:
	BTRSC	STATUS,0
	LGOTO	_00216_DS_
	.line	207, "main.c"; 	MOTOR = 1;
	BSR	_PORTA,2
	LGOTO	_00289_DS_
_00216_DS_:
	.line	210, "main.c"; 	MOTOR = 0;
	BCR	_PORTA,2
	.line	211, "main.c"; 	rockStep = 0;
	BANKSEL	_rockStep
	CLRR	_rockStep
	.line	212, "main.c"; 	if(++gewei >= 10)
	BANKSEL	_gewei
	INCR	_gewei,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_gewei,W
	BTRSS	STATUS,0
	LGOTO	_00289_DS_
	.line	214, "main.c"; 	gewei = 0;
	CLRR	_gewei
	.line	215, "main.c"; 	if(++shiwei >= 10)
	BANKSEL	_shiwei
	INCR	_shiwei,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_shiwei,W
	BTRSS	STATUS,0
	LGOTO	_00289_DS_
	.line	217, "main.c"; 	shiwei = 0;
	CLRR	_shiwei
	.line	218, "main.c"; 	if(++baiwei >= 10)
	BANKSEL	_baiwei
	INCR	_baiwei,F
;;unsigned compare: left < lit (0xA=10), size=1
	MOVIA	0x0a
	SUBAR	_baiwei,W
	BTRSC	STATUS,0
	.line	220, "main.c"; 	baiwei = 0;
	CLRR	_baiwei
_00289_DS_:
	.line	226, "main.c"; 	}
	RETURN	


;	code size estimation:
;	  765+  146 =   911 instructions ( 2114 byte)

	end
