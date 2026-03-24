module reg_file (
    input logic clk,
    input logic rst_n,
    input logic we,             // write enable
    input logic [4:0] a1,       // x1 address
    input logic [4:0] a2,       // x2 address
    input logic [4:0] a3,       // x3 address
    input logic [31:0] wd3,     // write data to a3
    output logic [31:0] rd1,    // read data from a1
    output logic [31:0] rd2 
); 

    logic [31:0] rf [31:0];

    assign rd1 = (a1 == 5'b0) ? 32'b0 : rf[a1]; 
    assign rd2 = (a2 == 5'b0) ? 32'b0 : rf[a2]; 

    always_ff @(posedge clk) begin
        if(we && a3 != 0) begin
            rf[a3] <= wd3;
        end
    end
    
endmodule 