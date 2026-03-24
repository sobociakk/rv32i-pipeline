module if_stage (
    input logic clk,
    input logic rst_n,
    input logic en,                  // enable
    input logic [31:0] branch_addr,  // address to jump to
    input logic pc_src,              // 1 if branch, 0 if not
    output logic [31:0] pc_o         // pc to next stage
);

    logic [31:0] pc_q, pc_d;
    logic [31:0] pc_plus_4;

    assign pc_d = (pc_src) ? branch_addr : pc_plus_4;

    pc PC (
        .clk(clk),
        .rst_n(rst_n),
        .en(en),
        .pc_d(pc_d),
        .pc_q(pc_q)
    );

    adder ADDER (
        .a(pc_q),
        .b(32'd4),
        .y(pc_plus_4)
    );

    assign pc_o = pc_q;

endmodule