interface decoder_if;
logic [3:0]x;
logic [15:0]y;
logic en;
modport dut(input en,x, output y);
modport tb(input y, output x,en);
endinterface
