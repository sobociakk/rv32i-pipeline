module pc (
    input logic clk,
    input logic rst_n,
    input logic en,
    input logic [31:0] pc_d,
    output logic [31:0] pc_q
);

    always_ff @(posedge clk or negedge rst_n) begin
        if (!rst_n)
            pc_q <= '0;
        else if(en == 1'b1)
            pc_q <= pc_d;
    end

endmodule