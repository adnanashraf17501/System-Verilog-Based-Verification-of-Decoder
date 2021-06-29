module decoder_assert(decoder_if intf);

sequence seq1;
	(!intf.en)##1(!intf.out);
endsequence

sequence seq2;
	(intf.en)##1(intf.out);
endsequence

property check_out;
	disable iff(!intf.en)
	intf.en|->(seq1 or seq2);
endproperty
assert property(check_out);
endmodule
