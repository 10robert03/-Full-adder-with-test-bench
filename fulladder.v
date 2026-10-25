module fulladder (
    input wire a,
    input wire b,
    input wire cin,
    output wire sum,
    output wire cout
    );

    assign sum  = a ^ b ^ cin;
    assign cout = (a & b) | (a & cin) | (b & cin);
endmodule

module adder4 (
    input wire [3:0] a,
    input wire [3:0] b,
    input wire cin,
    output wire [3:0] sum,
    output wire cout
);
    wire [2:0] c;
    fulladder bit0 (a[0], b[0], cin, sum[0], c[0]);
    fulladder bit1 (a[1], b[1], c[0], sum[1], c[1]);
    fulladder bit2 (a[2], b[2], c[1], sum[2], c[2]);
    fulladder bit3 (a[3], b[3], c[2], sum[3], cout);
endmodule
