`timescale 1ns / 1ps
//////////////////////////////////////////////////////////////////////////////////
// Company: 
// Engineer: 
// 
// Create Date: 08.08.2025 11:26:06
// Design Name: 
// Module Name: booth_mul_tb
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




module booth_mul_tb;

    // Inputs
    reg signed [15:0] multiplicand;
    reg signed [15:0] multiplier;

    // Output
    wire signed [31:0] product;

    // Instantiate the Unit Under Test (UUT)
    booth_mul uut (
        .multiplicand(multiplicand),
        .multiplier(multiplier),
        .product(product)
    );

    // Procedure
    initial begin
        $display("Time\t\tMultiplicand\tMultiplier\tExpected\tProduct");
        $monitor("%0t\t%d\t\t%d\t\t%d\t\t%d", $time, multiplicand, multiplier, multiplicand * multiplier, product);

        // Test 1: 5 * 3
        multiplicand = 16'sd5;
        multiplier = 16'sd3;
        #10;

        // Test 2: -7 * 4
        multiplicand = -16'sd7;
        multiplier = 16'sd4;
        #10;

        // Test 3: -6 * -8
        multiplicand = -16'sd6;
        multiplier = -16'sd8;
        #10;

        // Test 4: 0 * 20
        multiplicand = 16'sd0;
        multiplier = 16'sd20;
        #10;

        // Test 5: 100 * 0
        multiplicand = 16'sd100;
        multiplier = 16'sd0;
        #10;

        // Test 6: 32767 * 2 (max positive * 2)
        multiplicand = 16'sd32767;
        multiplier = 16'sd2;
        #10;

        // Test 7: -32768 * -1 (min negative * -1)
        multiplicand = -16'sd32768;
        multiplier = -16'sd1;
        #10;

        // Test 8: Random negative and positive values
        multiplicand = -16'sd1234;
        multiplier = 16'sd5678;
        #10;

        $display("Simulation Completed");
        $finish;
    end

endmodule
