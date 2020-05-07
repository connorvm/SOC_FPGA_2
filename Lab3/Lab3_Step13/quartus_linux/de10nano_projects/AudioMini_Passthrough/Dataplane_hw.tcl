# TCL File Generated by Component Editor 18.0
# Thu May 07 11:58:14 MDT 2020
# DO NOT MODIFY


# 
# Dataplane "Dataplane" v1.0
#  2020.05.07.11:58:14
# 
# 

# 
# request TCL package from ACDS 16.1
# 
package require -exact qsys 16.1


# 
# module Dataplane
# 
set_module_property DESCRIPTION ""
set_module_property NAME Dataplane
set_module_property VERSION 1.0
set_module_property INTERNAL false
set_module_property OPAQUE_ADDRESS_MAP true
set_module_property AUTHOR ""
set_module_property DISPLAY_NAME Dataplane
set_module_property INSTANTIATE_IN_SYSTEM_MODULE true
set_module_property EDITABLE true
set_module_property REPORT_TO_TALKBACK false
set_module_property ALLOW_GREYBOX_GENERATION false
set_module_property REPORT_HIERARCHY false


# 
# file sets
# 
add_fileset QUARTUS_SYNTH QUARTUS_SYNTH "" ""
set_fileset_property QUARTUS_SYNTH TOP_LEVEL dataplane_avalon
set_fileset_property QUARTUS_SYNTH ENABLE_RELATIVE_INCLUDE_PATHS false
set_fileset_property QUARTUS_SYNTH ENABLE_FILE_OVERWRITE_MODE false
add_fileset_file dataplane_avalon.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_avalon.vhd TOP_LEVEL_FILE
add_fileset_file dataplane_reset_sync.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_reset_sync.vhd
add_fileset_file dataplane_src_Avalon_Data_Processing.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Avalon_Data_Processing.vhd
add_fileset_file dataplane_src_Chart.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Chart.vhd
add_fileset_file dataplane_src_LED_Driver.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_Driver.vhd
add_fileset_file dataplane_src_LED_persistence_control.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_persistence_control.vhd
add_fileset_file dataplane_src_LED_persistence_control1.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_persistence_control1.vhd
add_fileset_file dataplane_src_LED_persistence_control2.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_persistence_control2.vhd
add_fileset_file dataplane_src_LED_persistence_control3.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_persistence_control3.vhd
add_fileset_file dataplane_src_LED_persistence_control4.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_persistence_control4.vhd
add_fileset_file dataplane_src_LED_persistence_control5.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_persistence_control5.vhd
add_fileset_file dataplane_src_LED_persistence_control6.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_persistence_control6.vhd
add_fileset_file dataplane_src_LED_persistence_control7.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_LED_persistence_control7.vhd
add_fileset_file dataplane_src_Left_Channel_Processing.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Left_Channel_Processing.vhd
add_fileset_file dataplane_src_Min.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Min.vhd
add_fileset_file dataplane_src_MinMax.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_MinMax.vhd
add_fileset_file dataplane_src_Normalize_Signal.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Normalize_Signal.vhd
add_fileset_file dataplane_src_Right_Channel_Processing.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Right_Channel_Processing.vhd
add_fileset_file dataplane_src_Signal_Energy_Monitor.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Signal_Energy_Monitor.vhd
add_fileset_file dataplane_src_Sound_Effects.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Sound_Effects.vhd
add_fileset_file dataplane_src_Sound_Effects_block.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_Sound_Effects_block.vhd
add_fileset_file dataplane_src_dataplane.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_dataplane.vhd
add_fileset_file dataplane_src_dataplane_pkg.vhd VHDL PATH ../../simulink_models/dataplane/dataplane_src_dataplane_pkg.vhd


# 
# parameters
# 


# 
# display items
# 


# 
# connection point clock
# 
add_interface clock clock end
set_interface_property clock clockRate 0
set_interface_property clock ENABLED true
set_interface_property clock EXPORT_OF ""
set_interface_property clock PORT_NAME_MAP ""
set_interface_property clock CMSIS_SVD_VARIABLES ""
set_interface_property clock SVD_ADDRESS_GROUP ""

add_interface_port clock clk clk Input 1


# 
# connection point reset
# 
add_interface reset reset end
set_interface_property reset associatedClock clock
set_interface_property reset synchronousEdges DEASSERT
set_interface_property reset ENABLED true
set_interface_property reset EXPORT_OF ""
set_interface_property reset PORT_NAME_MAP ""
set_interface_property reset CMSIS_SVD_VARIABLES ""
set_interface_property reset SVD_ADDRESS_GROUP ""

add_interface_port reset reset reset Input 1


# 
# connection point avalon_slave
# 
add_interface avalon_slave avalon end
set_interface_property avalon_slave addressUnits WORDS
set_interface_property avalon_slave associatedClock clock
set_interface_property avalon_slave associatedReset reset
set_interface_property avalon_slave bitsPerSymbol 8
set_interface_property avalon_slave burstOnBurstBoundariesOnly false
set_interface_property avalon_slave burstcountUnits WORDS
set_interface_property avalon_slave explicitAddressSpan 0
set_interface_property avalon_slave holdTime 0
set_interface_property avalon_slave linewrapBursts false
set_interface_property avalon_slave maximumPendingReadTransactions 0
set_interface_property avalon_slave maximumPendingWriteTransactions 0
set_interface_property avalon_slave readLatency 0
set_interface_property avalon_slave readWaitTime 1
set_interface_property avalon_slave setupTime 0
set_interface_property avalon_slave timingUnits Cycles
set_interface_property avalon_slave writeWaitTime 0
set_interface_property avalon_slave ENABLED true
set_interface_property avalon_slave EXPORT_OF ""
set_interface_property avalon_slave PORT_NAME_MAP ""
set_interface_property avalon_slave CMSIS_SVD_VARIABLES ""
set_interface_property avalon_slave SVD_ADDRESS_GROUP ""

add_interface_port avalon_slave avalon_slave_address address Input 2
add_interface_port avalon_slave avalon_slave_read read Input 1
add_interface_port avalon_slave avalon_slave_readdata readdata Output 32
add_interface_port avalon_slave avalon_slave_write write Input 1
add_interface_port avalon_slave avalon_slave_writedata writedata Input 32
set_interface_assignment avalon_slave embeddedsw.configuration.isFlash 0
set_interface_assignment avalon_slave embeddedsw.configuration.isMemoryDevice 0
set_interface_assignment avalon_slave embeddedsw.configuration.isNonVolatileStorage 0
set_interface_assignment avalon_slave embeddedsw.configuration.isPrintableDevice 0


# 
# connection point avalon_streaming_sink
# 
add_interface avalon_streaming_sink avalon_streaming end
set_interface_property avalon_streaming_sink associatedClock clock
set_interface_property avalon_streaming_sink associatedReset reset
set_interface_property avalon_streaming_sink dataBitsPerSymbol 32
set_interface_property avalon_streaming_sink errorDescriptor ""
set_interface_property avalon_streaming_sink firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_sink maxChannel 3
set_interface_property avalon_streaming_sink readyLatency 0
set_interface_property avalon_streaming_sink ENABLED true
set_interface_property avalon_streaming_sink EXPORT_OF ""
set_interface_property avalon_streaming_sink PORT_NAME_MAP ""
set_interface_property avalon_streaming_sink CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_sink SVD_ADDRESS_GROUP ""

add_interface_port avalon_streaming_sink avalon_sink_channel channel Input 2
add_interface_port avalon_streaming_sink avalon_sink_data data Input 32
add_interface_port avalon_streaming_sink avalon_sink_error error Input 2
add_interface_port avalon_streaming_sink avalon_sink_valid valid Input 1


# 
# connection point avalon_streaming_source
# 
add_interface avalon_streaming_source avalon_streaming start
set_interface_property avalon_streaming_source associatedClock clock
set_interface_property avalon_streaming_source associatedReset reset
set_interface_property avalon_streaming_source dataBitsPerSymbol 32
set_interface_property avalon_streaming_source errorDescriptor ""
set_interface_property avalon_streaming_source firstSymbolInHighOrderBits true
set_interface_property avalon_streaming_source maxChannel 3
set_interface_property avalon_streaming_source readyLatency 0
set_interface_property avalon_streaming_source ENABLED true
set_interface_property avalon_streaming_source EXPORT_OF ""
set_interface_property avalon_streaming_source PORT_NAME_MAP ""
set_interface_property avalon_streaming_source CMSIS_SVD_VARIABLES ""
set_interface_property avalon_streaming_source SVD_ADDRESS_GROUP ""

add_interface_port avalon_streaming_source avalon_source_channel channel Output 2
add_interface_port avalon_streaming_source avalon_source_data data Output 32
add_interface_port avalon_streaming_source avalon_source_error error Output 2
add_interface_port avalon_streaming_source avalon_source_valid valid Output 1


# 
# connection point conduit_end
# 
add_interface conduit_end conduit end
set_interface_property conduit_end associatedClock ""
set_interface_property conduit_end associatedReset ""
set_interface_property conduit_end ENABLED true
set_interface_property conduit_end EXPORT_OF ""
set_interface_property conduit_end PORT_NAME_MAP ""
set_interface_property conduit_end CMSIS_SVD_VARIABLES ""
set_interface_property conduit_end SVD_ADDRESS_GROUP ""

add_interface_port conduit_end LED led Output 8

