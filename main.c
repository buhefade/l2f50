#include "stm8s.h"
 
 
void myDelay(void);
 
void myDelay()
{
   int i,j;
   for(i=0;i<1000;i++)
   {
       for(j=0;j<100;j++);    
       }  
}   
 
main()   
{            
     GPIOD->DDR |= 0x01;  // PD.0 as Output
     GPIOD->CR1 |= 0x01;  // PD.0 as Push Pull Type Output
     while (1)
     {
            GPIOD->ODR |=1<<0;  // PD.o = 1             
            myDelay();                          
            GPIOD->ODR &= ~(1<<0); // PD.0 = 0
            myDelay();
     }
}