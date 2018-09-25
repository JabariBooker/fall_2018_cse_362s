# 
# Synthesis run script generated by Vivado
# 

set TIME_start [clock seconds] 
proc create_report { reportName command } {
  set status "."
  append status $reportName ".fail"
  if { [file exists $status] } {
    eval file delete [glob $status]
  }
  send_msg_id runtcl-4 info "Executing : $command"
  set retval [eval catch { $command } msg]
  if { $retval != 0 } {
    set fp [open $status w]
    close $fp
    send_msg_id runtcl-5 warning "$msg"
  }
}
set_msg_config -id {HDL 9-1061} -limit 100000
set_msg_config -id {HDL 9-1654} -limit 100000
create_project -in_memory -part xc7a100tcsg324-1

set_param project.singleFileAddWarning.threshold 0
set_param project.compositeFile.enableAutoGeneration 0
set_param synth.vivado.isSynthRun true
set_msg_config -source 4 -id {IP_Flow 19-2162} -severity warning -new_severity info
set_property webtalk.parent_dir C:/fall_2018_cse_361s/Hw2/Hw2.cache/wt [current_project]
set_property parent.project_path C:/fall_2018_cse_361s/Hw2/Hw2.xpr [current_project]
set_property XPM_LIBRARIES {XPM_CDC XPM_MEMORY} [current_project]
set_property default_lib xil_defaultlib [current_project]
set_property target_language VHDL [current_project]
set_property ip_output_repo c:/fall_2018_cse_361s/Hw2/Hw2.cache/ip [current_project]
set_property ip_cache_permissions {read write} [current_project]
read_vhdl -library xil_defaultlib {
  C:/fall_2018_cse_361s/Hw2/a.vhd
  C:/fall_2018_cse_361s/Hw2/alu.vhd
  C:/fall_2018_cse_361s/Hw2/c.vhd
  C:/fall_2018_cse_361s/Hw2/conbit.vhd
  C:/fall_2018_cse_361s/Hw2/control.vhd
  C:/fall_2018_cse_361s/Hw2/controlstore.vhd
  C:/fall_2018_cse_361s/Hw2/eprom.vhd
  C:/fall_2018_cse_361s/Hw2/ir.vhd
  C:/fall_2018_cse_361s/Hw2/ma.vhd
  C:/fall_2018_cse_361s/Hw2/md.vhd
  C:/fall_2018_cse_361s/Hw2/pc.vhd
  C:/fall_2018_cse_361s/Hw2/regfile.vhd
  C:/fall_2018_cse_361s/Hw2/rsrc.vhd
  C:/fall_2018_cse_361s/Hw2/shiftcounter.vhd
  C:/fall_2018_cse_361s/Hw2/sram.vhd
  C:/fall_2018_cse_361s/Hw2/vga.vhd
  C:/fall_2018_cse_361s/Hw2/testbench.vhd
}
read_ip -quiet C:/fall_2018_cse_361s/Hw2/Hw2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xci
set_property used_in_implementation false [get_files -all c:/fall_2018_cse_361s/Hw2/Hw2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_board.xdc]
set_property used_in_implementation false [get_files -all c:/fall_2018_cse_361s/Hw2/Hw2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0.xdc]
set_property used_in_implementation false [get_files -all c:/fall_2018_cse_361s/Hw2/Hw2.srcs/sources_1/ip/clk_wiz_0/clk_wiz_0_ooc.xdc]

read_ip -quiet C:/fall_2018_cse_361s/Hw2/Hw2.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0.xci
set_property used_in_implementation false [get_files -all c:/fall_2018_cse_361s/Hw2/Hw2.srcs/sources_1/ip/blk_mem_gen_0/blk_mem_gen_0_ooc.xdc]

# Mark all dcp files as not used in implementation to prevent them from being
# stitched into the results of this synthesis run. Any black boxes in the
# design are intentionally left as such for best results. Dcp files will be
# stitched into the design at a later time, either when this synthesis run is
# opened, or when it is stitched into a dependent implementation run.
foreach dcp [get_files -quiet -all -filter file_type=="Design\ Checkpoint"] {
  set_property used_in_implementation false $dcp
}
read_xdc C:/fall_2018_cse_361s/Hw2/rsrc.xdc
set_property used_in_implementation false [get_files C:/fall_2018_cse_361s/Hw2/rsrc.xdc]

set_param ips.enableIPCacheLiteLoad 0
close [open __synthesis_is_running__ w]

synth_design -top testbench -part xc7a100tcsg324-1


# disable binary constraint mode for synth run checkpoints
set_param constraints.enableBinaryConstraints false
write_checkpoint -force -noxdef testbench.dcp
create_report "synth_1_synth_report_utilization_0" "report_utilization -file testbench_utilization_synth.rpt -pb testbench_utilization_synth.pb"
file delete __synthesis_is_running__
close [open __synthesis_is_complete__ w]
