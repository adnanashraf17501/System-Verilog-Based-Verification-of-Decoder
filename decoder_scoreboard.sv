`ifndef scoreboard
`define scoreboard
`include "decoder_base.sv"

class scoreboard;
	base_pkt pkt1, pkt2;
	mailbox drv2sb, mon2sb;

	function new(base_pkt pkt1, pkt2, mailbox drv2sb, mon2sb);
		this.pkt1=pkt1;
                this.pkt2=pkt2;
		this.drv2sb=drv2sb;
		this.mon2sb=mon2sb;
	endfunction

	task sb_run();
	begin
		drv2sb.get(pkt1);
		mon2sb.get(pkt2);
		#10
		if(pkt2.y==(2**(pkt1.x)))
               $display("Results are matched, X=%d, Y=%b",pkt1.x,pkt2.y);
       else
	       $display("Results are not matched, X=%d, Y=%b",pkt1.x,pkt2.y);  
   end
   endtask
   endclass
   `endif
