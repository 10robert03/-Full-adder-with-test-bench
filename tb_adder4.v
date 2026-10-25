`timescale 1ns/1ps

module tb_adder4;
    reg [3:0] a, b;
    reg cin;
    wire [3:0] sum;
    wire cout;
    reg [4:0] expected;
    adder4 test(
        a, b, cin, sum, cout
    );
    integer i;
    integer errors = 0;
    initial begin
        $dumpfile("adder4.vcd");
        $dumpvars(0, tb_adder4);
        for(i = 0; i < 512; i = i +1) begin // 512 because 2⁴ * 2⁴ * 2 for [3:0]a and b and 1 bit for cin
            {a, b, cin} = i;
            expected = a + b + cin;
            #10;
            if(expected !== {cout, sum})begin
                errors = errors + 1;
            end
        end

        if(errors == 0) $display("No errors occured.");
        else $display("%d errors occured", errors);
        $finish;
    end
endmodule
        
