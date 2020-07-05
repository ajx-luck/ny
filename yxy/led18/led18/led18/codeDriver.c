﻿// =========================================================================
// Created by NYIDE.
// User: hhmm6
// Date: 7/3/2020
// Description:	send code
// =========================================================================
#include <ny8.h>
#include "NY8_constant.h"
#include "codeDriver.h"



void sendtoLast(char ledNub,unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	for(int i=0;i<ledNub;i++)
	{
		sendRGB(colorR,colorG,colorB);
	}
	Delay80us();
}


void sendRGB(unsigned char colorR,unsigned char colorG,unsigned char colorB)
{
	long tempColor = colorR;
	tempColor = tempColor<<8;
	tempColor+=colorG;
	tempColor = tempColor<<8;
	tempColor+=colorB;
	tempColor = tempColor<<8;
	for(unsigned char i=24;i>0;i--)
	{
		tempColor = tempColor<<1;
		if(D)
		{
			PB0 = 0;
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			PB0 = 1;
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
		}
		else
		{
			PB0 = 1;
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
			PB0 = 0;
			NOP();
			NOP();
			NOP();
			NOP();
			NOP();
		}
	}
	PB0 = 0;
}


void Delay80us()
{
	for(unsigned char i=0;i<80;i++)
		NOP();
}

