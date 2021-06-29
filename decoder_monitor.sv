`ifndef monitor
`define monitor
`include "decoder_base.sv"
class monitor;
	base_pkt pkt;
	mailbox mon2sb;
	virtual decoder_if intf;

	function new(base_pkt pkt, mailbox mon2sb, virtual decoder_if intf);
		this.pkt=pkt;
		this.mon2sb=mon2sb;
		this.intf=intf;
	endfunction

	task mon_run();
	begin
		#2
	       pkt.y=intf.y;
	       pkt.x=intf.x;
	       mon2sb.put(pkt);
		   $display("@Mon=%p",pkt);
       end
       endtask
       endclass
       `endif
