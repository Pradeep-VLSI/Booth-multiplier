`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2025 11:20:30
// Design Name: 
// Module Name: booth_mul
// Project Name: 
// Target Devices: 
// Tool Versions: 
// Description: 
// 
// Dependencies: 
// 
// Revision:
// Revision 0.01 - File Created
// Additional Comments:
// 
//////////////////////////////////////////////////////////////////////////////////



`timescale 1ns / 1ps

module booth_mul(
    input  signed [15:0] multiplicand,
    input  signed [15:0] multiplier,
    output signed [31:0] product
);
    wire [255:0] partial_products;
    wire [31:0] sum, carry;
    wire carryout;

    boothalgm booth_inst (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(partial_products)
    );

    wallactreeee wallace_inst (
        .pp(partial_products[127:0]), // Use the lower 128 bits
        .sumlast1(sum),
        .sumlast2(carry)
    );

    fastadderrr cla_inst (
        .A(sum),
        .B(carry),
        .Cin(1'b0),
        .Sum(product),
        .Cout(carryout)
    );
endmodule
`timescale 1ns / 1ps

module boothalgm(
    input  signed [15:0] multiplicand,
    input  signed [15:0] multiplier,
    output reg [255:0] product
);
    reg signed [31:0] partial_products[0:7];
    integer i;

    always @(*) begin
        for (i = 0; i < 8; i = i + 1) begin
            case ({multiplier[2*i+1], multiplier[2*i], (i == 0 ? 1'b0 : multiplier[2*i-1])})
                3'b000, 3'b111: partial_products[i] = 0;
                3'b001, 3'b010: partial_products[i] = multiplicand;
                3'b011: partial_products[i] = multiplicand << 1;
                3'b100: partial_products[i] = -(multiplicand << 1);
                3'b101, 3'b110: partial_products[i] = -multiplicand;
     
     
                default: partial_products[i] = 0;
            endcase
            partial_products[i] = partial_products[i] << (2 * i);
        end


        product = 0;
        for (i = 0; i < 8; i = i + 1)
            product = product | (partial_products[i] << (32 * i));
    end
endmodule
`timescale 1ns / 1ps

module wallactreeee(
    input [127:0] pp,
    output [31:0] sumlast1,
    output [31:0] sumlast2
);
    assign sumlast1 = pp[31:0];
    assign sumlast2 = pp[63:32];
endmodule
`timescale 1ns / 1ps

module fastadderrr(
    input  [31:0] A, B,
    input  Cin,
    output [31:0] Sum,
    output Cout
);
    wire [31:0] P, G;
    wire [32:0] Carry;

    assign P = A ^ B;
    assign G = A & B;

    assign Carry[0] = Cin;

    genvar i;
    generate
        for (i = 0; i < 32; i = i + 1) begin
            assign Carry[i+1] = G[i] | (P[i] & Carry[i]);
        end
    endgenerate

    assign Sum = P ^ Carry[31:0];
    assign Cout = Carry[32];
endmodule
