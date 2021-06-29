//decoder_4_16
module decoder_dut(decoder_if.dut intf);
assign intf.y=2**(intf.x);   //2bits concatenated with x as 4 bits gives 16 bits y as output
endmodule
