/*
 * File Name:         hdl_prj\ipcore\dataplane_v1_0\include\dataplane_addr.h
 * Description:       C Header File
 * Created:           2020-05-07 10:47:51
*/

#ifndef DATAPLANE_H_
#define DATAPLANE_H_

#define  IPCore_Reset_dataplane       0x0  //write 0x1 to bit 0 to reset IP core
#define  IPCore_Enable_dataplane      0x4  //enabled (by default) when bit 0 is 0x1
#define  IPCore_Timestamp_dataplane   0x8  //contains unique IP timestamp (yymmddHHMM): 2005071047

#endif /* DATAPLANE_H_ */
