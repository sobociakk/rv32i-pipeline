module imm_gen (
    input logic [31:7] instr,
    input logic [2:0] imm_src,
    output logic [31:0] imm_ext
);

    always_comb begin
        case(imm_src)
            3'b000: imm_ext = {{20{instr[31]}}, instr[31:20]};                                // Type I (e.g ADDI)
            3'b001: imm_ext = {{20{instr[31]}}, instr[31:25], instr[11:7]};                   // Type S (e.g SW)
            3'b010: imm_ext = {{20{instr[31]}}, instr[7], instr[30:25], instr[11:8], 1'b0};   // Type B (e.g BEQ)
            3'b011: imm_ext = {{12{instr[31]}}, instr[19:12], instr[20], instr[30:21], 1'b0}; // Type J (e.g JAL)
            3'b100: imm_ext = {instr[31:12], 12'b0};                                          // Type U (e.g LUI)
            default: imm_ext = 32'b0;
        endcase
    end

endmodule