module tb_alu;

    logic [31:0] a, b;
    logic [31:0] result;
    logic zero;
    alu_op_t op;

    alu dut (
        .a(a),
        .b(b),
        .op(op),
        .result(result),
        .zero(zero)
    );

    initial $timeformat(-9, 2, " ns", 10);

    initial begin
        $display("Starting ALU simulation");
        $display("%-5s | %-8s | %-10s | %-10s | %-12s | %-1s", 
                "Time", "OP", "A (hex)", "B (hex)", "Result (hex)", "Z");
        $monitor("%-5t | %-8s | %-10h | %-10h | %-12h | %-1b", 
                $time, op, a, b, result, zero);

        // Regular addition: 5 + 10
        a = 32'd5;
        b = 32'd10;
        op = ALL_ADD;
        #10;

        // Subtraction: 15 - 15 
        a = 32'd15;
        b = 32'd15;
        op = ALL_SUB;
        #10;

        // SLT (Signed) vs SLTU (Unsigned)
        // a = -1, b = 1
        a = 32'hFFFFFFFF; 
        b = 32'h00000001;
        // SLT (Set Less Than - signed)
        // Is -1 < 1
        op = ALL_SLT;
        #10;

        // Is 4294967295 < 1
        op = ALL_SLTU; 
        #10;

        // SLL (Shift Left Logical): 1 << 4 = 16
        a = 32'd1;
        b = 32'd4;
        op = ALL_SLL;
        #10;

        $display("Simulation ended.");
        $finish;
    end
endmodule