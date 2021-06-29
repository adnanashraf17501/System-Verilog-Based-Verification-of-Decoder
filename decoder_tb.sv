`include "decoder_base.sv"
`include "decoder_generator.sv"
`include "decoder_driver.sv"
`include "decoder_monitor.sv"
`include "decoder_scoreboard.sv"

program decoder_tb(decoder_if.dut intf);
	base_pkt pkt1,pkt2;
	generator gen;
	driver drv;
	monitor mon;
	scoreboard sb;
	mailbox gen2drv,drv2sb,mon2sb;

	initial begin
	pkt1=new;
	pkt2=new;
	gen2drv=new;
	drv2sb=new;
	mon2sb=new;
	gen=new(pkt1,gen2drv);
	drv=new(pkt1,gen2drv,drv2sb,intf);
	mon=new(pkt2,mon2sb,intf);
	sb=new(pkt1,pkt2,drv2sb,mon2sb);
end

initial 
	repeat(16) begin
	gen.gen_run();
	drv.drv_run();
	mon.mon_run();
	sb.sb_run();
	#2;
end
endprogram
