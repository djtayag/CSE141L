module InstROM (
    input        [7:0] InstAddress,

    output logic [8:0] InstOut
);

logic [8:0] inst_rom[256];

always_comb InstOut = inst_rom[InstAddress];

initial begin
    $readmemb("machine_code.txt", inst_rom); 
end

endmodule