/**
  ******************************************************************************
  * @file    vk1s68c_driver.h
  * @author  kevin_guo
  * @version V1.0.0
  * @date    072-01-2019
  * @brief   This file contains all files for vk1s68c_driver.
  ******************************************************************************
  * @attention
  ******************************************************************************
  */
/* Includes ------------------------------------------------------------------*/
#include "global.h"

/* extern variables ----------------------------------------------------------*/
//extern uint8_t ic_key;
/* Private typedef -----------------------------------------------------------*/
/* Private define ------------------------------------------------------------*/
/* Private macro -------------------------------------------------------------*/
/* Private variables ---------------------------------------------------------*/
uint8_t vk1s68c_write_buf[16];
uint8_t vk1s68c_key;
uint16_t  vk1s68c_k1_buf, vk1s68c_k2_buf; 
/* Private function prototypes -----------------------------------------------*/
/* Private function ----------------------------------------------------------*/
/*******************************************************************************
* Function Name  : cc_nopdelay
* Description    : ��ʱ
* Input          : dur
* Output         : None
* Return         : None
*******************************************************************************/
void vk1S68C_nopdelay(uint32_t dur)
{
//	uint32_t	i;
//	
//	while(dur)
//	{
//		dur--;
//		i=1;
//		while(i--)
//		{	
//			__nop();__nop();__nop();__nop();__nop();
//		}
//	}
}
/*******************************************************************************
* Function Name  : Set_testPara
* Description    : ��ʱ�ӵ�������ͨ��MCU��LED����ICд1���ֽ�����
* Input          : data8
* Output         : None
* Return         : None
*******************************************************************************/
void VK1S68CWrite1BytetoIC(uint8_t data8)
{
	uint8_t i;
	
	VK1S68C_STB_LOW;			//��֤��STB��Ϊ�͵�ƽ������������֮ǰ�˿ڵ�״̬
	for(i=0;i<8;i++)
	{
		VK1S68C_SLK_LOW;		//�Ƚ���CLK������
		if((data8&0x01)!=0)
		{
			VK1S68C_DAT_HIGH;//��Ҫ���͵����ݵĵ�λΪ��1������ѡ�DIO���ø�
		}
		else
		{
			VK1S68C_DAT_LOW;	//��Ҫ���͵����ݵĵ�λΪ��0������ѡ�DIO������
		}
		vk1S68C_nopdelay(200);
		VK1S68C_SLK_HIGH;	//��ʱ�ӵ�������
		vk1S68C_nopdelay(200);
		data8=data8>>1;		//׼������һ��BIT
	
	}//����һ���ֽں��˳�ѭ��
}

/*******************************************************************************
* Function Name  : VK1S68CRead1BytefromIC
* Description    : ��ʱ�ӵ�������ͨ��MCU��LED����IC��1���ֽ�����
* Input          : data8
* Output         : None
* Return         : None
*******************************************************************************/
uint8_t VK1S68CRead1BytefromIC(void)
{
	uint8_t i,k=0;//i��������ѭ��������k������ʱ�������������

	VK1S68C_DAT_HIGH;	//�ͷ�DIOΪ����
	VK1S68C_STB_LOW;	//��֤��STB��Ϊ�͵�ƽ������������֮ǰ�˿ڵ�״̬
	for(i=0;i<8;i++)
	{
		VK1S68C_SLK_LOW;//�Ƚ���CLK������
		vk1S68C_nopdelay(200);
		k=k>>1;
		if(VK1S68C_DIO_IO==0)
		{
			k=k&0x7f;			//�����DIO��Ϊ�͵�ƽ�����k�����λ�塰0����������λ���ֲ���
		}
		else
		{
			k=(k|0x80)&0xff;//�����DIO��Ϊ�ߵ�ƽ�����k�����λ�á�1����������λ���ֲ���
		}
		VK1S68C_SLK_HIGH;	//��ʱ�ӵ�������
		vk1S68C_nopdelay(200);
	}//����һ���ֽں��˳�ѭ��
	
	return(k);//���ض�����1�ֽ�����	
}
/*******************************************************************************
* Function Name  : Disp_AutoAdd1Addr
* Description    : ���õ�ַ�Զ���һ��ʽ�����ַ������
* Input          : cmdaddr   д��ĵ�ַ
*					 			 : databuf   ���ݻ���
*                : num       д������ݸ���
* Output         : None
* Return         : None
*******************************************************************************/
void VK1S68C_Disp_AutoAdd1Addr(uint8_t addr,uint8_t* databuf, uint8_t num)
{
	uint8_t i;//i�������Ʊ�����Ҫ�����ٸ��ֽ���ʾ����
	
	VK1S68C_STB_HIGH;//ͨѶ��ʼǰͨѶ�˿�ȫ����ʼ��Ϊ��1��	
	VK1S68CWrite1BytetoIC(VK1S68C_WRDTA_AUTOADD1ADDR);//����������������ò��õ�ַ�Զ���1��ʽд��ʾ���ݣ�
	VK1S68C_STB_HIGH;//����������������Ҫ����STB���á�1��
	VK1S68CWrite1BytetoIC(VK1S68C_STARTADDR+addr);//����ʼ��ַ
	//��ַ�����󣬡�STB������Ϊ��0����������Ҫ��ʾ������
	for(i=0;i<num;i++)
	{
		VK1S68CWrite1BytetoIC(*databuf++);//����������ʾ�����ݹ����У���STB��һֱ����Ϊ��0��
	}
	VK1S68C_STB_HIGH;//�������е���ʾ���ݺ����14BYTE���󣬽���STB�á�1��
	VK1S68CWrite1BytetoIC(VK1S68C_DISP_ON|VK1S68C_PDUTY_12_16);//����ʾ��������
	VK1S68C_STB_HIGH;//��ʾ���������󽫡�STB���á�1��
}
/*******************************************************************************
* Function Name  : VK1S68C_Disp_FixedAddr
* Description    : ���õ�ַ�̶���ʽ�����ַ������
* Input          : disa
* Output         : None
* Return         : None
*******************************************************************************/
void VK1S68C_Disp_FixedAddr(uint8_t addr, uint8_t data8)
{
	VK1S68C_STB_HIGH;//ͨѶ��ʼǰͨѶ�˿�ȫ����ʼ��Ϊ��1��	
	VK1S68CWrite1BytetoIC(VK1S68C_WRDTA_FIXEDADDR);//����������������ò��ù̶���ַд��ʾ���ݣ�
	VK1S68C_STB_HIGH;//����������������Ҫ����STB���á�1��
	VK1S68CWrite1BytetoIC(VK1S68C_STARTADDR+addr);//����ʾ���ݶ�Ӧ�ĵ�ַ
	//��ַ�����󣬡�STB������Ϊ��0����������Ҫ��ʾ������
	VK1S68CWrite1BytetoIC(data8);//���֡�STB��=��0������1BYTE��ʾ����
	VK1S68C_STB_HIGH;//������ʾ���ݺ󽫡�STB���á�1��
	VK1S68CWrite1BytetoIC(VK1S68C_DISP_ON|VK1S68C_PDUTY_12_16);//����ʾ��������
	VK1S68C_STB_HIGH;//��ʾ���������󽫡�STB���á�1��
}
	
/*******************************************************************************
* Function Name  : KeyScan
* Description    : ����ɨ��,����ӵ��ֽڿ�ʼ��
* Input          : disa
* Output         : None
* Return         : None
*******************************************************************************/
uint8_t VK1S68C_KeyScan(void)
{
	VK1S68C_STB_HIGH;
	VK1S68CWrite1BytetoIC(VK1S68C_CMD_READKEY);//�����������������Ϊ������
	//��STB������Ϊ��0��������ֵ
	//�������ļ�ֵ������MCU�ļĴ�����
	//����IC�ͺŶ�ָ���ֽڣ������������������ɶ��������ȶ�
	if(vk1s68c_key>=1)
		vk1s68c_k1_buf=VK1S68CRead1BytefromIC();
	if(vk1s68c_key>=2)
		vk1s68c_k2_buf=VK1S68CRead1BytefromIC();
	VK1S68C_STB_HIGH;
	
	return 0;//������������STB���á�1��
}
/*******************************************************************************
* Function Name  : Vk1S68C_Init
* Description    : 16240��ʼ��
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/ 
void VK1S68C_Init(void)    
{   
	GPIO_SetMode(VK1S68C_STB_PORT, VK1S68C_STB_PIN, GPIO_MODE_OUTPUT);
	GPIO_SetMode(VK1S68C_CLK_PORT, VK1S68C_CLK_PIN, GPIO_MODE_OUTPUT);
	GPIO_SetMode(VK1S68C_DIO_PORT, VK1S68C_DIO_PIN, GPIO_MODE_OUTPUT);
	
	VK1S68C_STB_HIGH;                
	VK1S68C_SLK_HIGH;   
	VK1S68C_DAT_HIGH;
}  

/*******************************************************************************
* Function Name  : VK1S68C_Main
* Description    : 1S68C���Գ���
* Input          : None
* Output         : None
* Return         : None
*******************************************************************************/ 
void VK1S68C_Main(void)
{   
	uint8_t i,j;
	
	VK1S68C_Init();
	 
	for(i=0;i<14;i++)
	{
		vk1s68c_write_buf[i]=0x00;
	}
	VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //14�������ȫ��
	DelaymS(1000); 
	while(1)
	{
		for(i=0;i<14;i++)
		{
			vk1s68c_write_buf[i]=0xff;
		}
		VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //14�������ȫ��
		DelaymS(1000); 
		for(i=0;i<14;i++)
		{
			vk1s68c_write_buf[i]=0x00;
		}
		VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //ȫ��
		DelaymS(1000); 
		
		for(j=0;j<14;j++)
		{
			for(i=0;i<14;i++)
			{
				vk1s68c_write_buf[i]=0x00;
			}
			vk1s68c_write_buf[j]=0xff;
			VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //ȫ��
			DelaymS(500); 
		}
		for(j=0;j<8;j++)
		{
			for(i=0;i<14;i++)
			{
				vk1s68c_write_buf[i]=(1<<j);
			}
			VK1S68C_Disp_AutoAdd1Addr(0,vk1s68c_write_buf,14);   //ȫ��
			DelaymS(1000); 
		}
		
		__nop();
	}
}    
/************************END OF FILE****/
