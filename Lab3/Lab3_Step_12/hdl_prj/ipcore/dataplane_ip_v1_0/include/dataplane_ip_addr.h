/*
 * File Name:         hdl_prj\ipcore\dataplane_ip_v1_0\include\dataplane_ip_addr.h
 * Description:       C Header File
 * Created:           2020-04-22 15:35:37
*/

#ifndef DATAPLANE_IP_H_
#define DATAPLANE_IP_H_

#define  IPCore_Reset_dataplane_ip       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_dataplane_ip      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_dataplane_ip   0x8  //contains unique IP timestamp (yymmddHHMM): 2004221535

#endif /* DATAPLANE_IP_H_ */
