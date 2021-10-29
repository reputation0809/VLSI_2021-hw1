module Hazard_unit(Branch_Ctrl,EX_Memread,EX_rd_addr,rs1,rs2,ImmType,flush,EX_flush,IFIDwrite,PCwrite);
    input [1:0] Branch_Ctrl;
    input EX_Memread;
    input [4:0] EX_rd_addr;
    input [4:0] rs1,rs2;
    input [2:0] ImmType;
    output logic flush,EX_flush,IFIDwrite,PCwrite;

    always @(*) begin
        if(Branch_Ctrl!=2'b10) begin
            flush=1'b1;
            EX_flush=1'b1;
            IFIDwrite=1'b1;
            PCwrite=1'b1;
        end
        else if((EX_rd_addr==rs1||EX_rd_addr==rs2)&&EX_Memread) begin
            flush=1'b0;
            EX_flush=1'b1;
            IFIDwrite=1'b0;
            PCwrite=1'b0;
        end
        else begin
            flush=1'b0;
            EX_flush=1'b0;
            IFIDwrite=1'b1;
            PCwrite=1'b1;
        end
    end
endmodule