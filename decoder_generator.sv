`ifndef generator
`define generator
`include "decoder_base.sv"
        class generator;
		base_pkt pkt;
		mailbox gen2drv;
function new(base_pkt pkt, mailbox gen2drv);
	this.pkt=pkt;
	this.gen2drv=gen2drv;
endfunction

task gen_run();
begin
	pkt.randomize();
	gen2drv.put(pkt);
end
endtask
endclass
`endif
