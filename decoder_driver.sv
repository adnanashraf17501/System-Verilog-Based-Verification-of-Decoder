`ifndef driver
`define driver
`include "decoder_base.sv"

class driver;
	base_pkt pkt;
	mailbox gen2drv, drv2sb;
	virtual decoder_if intf;

	function new(base_pkt pkt, mailbox gen2drv, drv2sb, virtual decoder_if intf);
		this.pkt=pkt;
		this.gen2drv=gen2drv;
		this.drv2sb=drv2sb;
		this.intf=intf;
	endfunction

	task drv_run();
	begin
		gen2drv.get(pkt);
		intf.x=pkt.x;
		intf.en=1'b1;
		drv2sb.put(pkt);
		$display("@Driver=%p", pkt);
	end
endtask
endclass
`endif
