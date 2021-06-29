`include "decoder_interface.sv"
`include "decoder_dut.sv"
`include "decoder_tb.sv"


module decoder_top();
    decoder_if intf();
    decoder_dut dut(intf);
    decoder_tb tb(intf);
    endmodule
