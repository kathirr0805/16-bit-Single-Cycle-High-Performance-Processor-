module data_memory(read_data,address,write_data,mem_write,mem_read);

output reg [31:0] read_data;
input [31:0] address; 
input [31:0] write_data;
input mem_read,mem_write;


reg [31:0] _memory [255:0]; 

initial begin
	$readmemb("C:/Users/itzka/OneDrive/Documents/Vivado/Intern/PRO5/MIPS_NEW/src/mem_memory.txt", _memory);
end

always @(*) begin
	if (mem_read) begin
		read_data <= _memory[address];
	end
	
	if (mem_write) begin
		_memory[address] <= write_data[31:0];
		$writememb("C:/Users/itzka/OneDrive/Documents/Vivado/Intern/PRO5/MIPS_NEW/src/mem_memory.txt", _memory);
	end
end

endmodule