#ifndef __SCANKEY_H__
#define __SCANKEY_H__


#define _press_		0
#define _release_	1


extern typedef enum key_press_type_f{
	shortPress 		= 0,
	extendedPress 	= 1
}key_press_type;

typedef void (*keyProess)(key_press_type type);

enum {Init_State,Affirm_State,Single_State,Repeat_State};


typedef struct key_t {
	uint8_t key_x;			//	按键
	uint16_t debounceTime;	//	消抖时间
	uint8_t keyFlowFlag;	//	按键流程标志
	keyProess proess;		//	按键执行函数
} key_struct;

extern key_struct K1_struct;
// extern key_struct K2_struct;
// extern key_struct K3_struct;

extern void KEY_Proess(uint8_t currentKey, key_press_type type);
extern void ScanKey_Config(void);
extern void ScanKey(key_struct *keyStruct);


#endif