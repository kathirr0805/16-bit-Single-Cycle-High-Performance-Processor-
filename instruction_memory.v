module instruction_memory(read_address,_instruction);

input [31:0] read_address;
output reg[15:0] _instruction;

reg [15:0] instr_memory [29:0];

initial begin
	$readmemb("C:/Users/itzka/OneDrive/Documents/Vivado/Intern/PRO5/MIPS_NEW/src/instruction_data.txt", instr_memory);
end


always @(*) begin
	_instruction = instr_memory[read_address];
end

endmodule

