`timescale 1ns/1ps

module tb_fulladder;
    reg a, b, cin;
    wire sum, cout;
    reg [1:0] expected;
    fulladder test(
        a, b, cin, sum, cout
    );
    integer i;
    integer errors = 0;
    initial begin
        $dumpfile("fulladder.vcd");
        $dumpvars(0, tb_fulladder);
        for(i = 0; i < 8; i = i + 1) begin
            {a, b, cin} = i;
            expected = a + b + cin;
            #10;
            if({cout, sum} !== expected) begin
                errors = errors +1;
                $display("ERROR: %b %b %b -> sum=%b cout=%b, expected %b", a, b, cin, sum, cout, expected);
            end 
            else begin
                $display("%b %b %b -> sum = %b cout = %b, expected %b | OK", a, b, cin, sum, cout, expected);
            end
        end 

        if(errors == 0) $display("Everything good");
        else $display("%d errors occured", errors);
        $finish;
    end
endmodule
