module VM_tb;

reg clk_i;
reg rst_i;
reg [1:0] din_i;

wire Pr_o;
wire Re_o;

VM uut (
    .din_i(din_i),
    .clk_i(clk_i),
    .rst_i(rst_i),
    .Pr_o(Pr_o),
    .Re_o(Re_o)
);

always #5 clk_i = ~clk_i;

task reset_vm;
begin
    rst_i = 1'b1;
    din_i = 2'b00;
    @(posedge clk_i);
    #1;
    rst_i = 1'b0;
    @(posedge clk_i);
end
endtask

task insert_coin;
input [1:0] coin;
begin
    din_i = coin;
    #1;
    $display("Time=%0t | State=%b | Coin=%b -> Product=%b | Change=%b",
              $time, uut.ps, din_i, Pr_o, Re_o);
    
    @(posedge clk_i);
    #1;
    din_i = 2'b00;
end
endtask

initial begin
    clk_i = 0;
    rst_i = 0;
    din_i = 2'b00;

    $display("\n===== TEST CASE 1 : Rs1 + Rs1 + Rs1 =====");
    reset_vm();
    insert_coin(2'b10);   
    insert_coin(2'b10);   
    insert_coin(2'b10);   

    #20;

    $display("\n===== TEST CASE 2 : Rs1 + Rs2 =====");
    reset_vm();
    insert_coin(2'b10);   
    insert_coin(2'b11);   

    #20;

    $display("\n===== TEST CASE 3 : Rs2 + Rs1 =====");
    reset_vm();
    insert_coin(2'b11);   
    insert_coin(2'b10);   

    #20;

    $display("\n===== TEST CASE 4 : Rs2 + Rs2 =====");
    reset_vm();
    insert_coin(2'b11);   
    insert_coin(2'b11);   

    #20;

    $finish;
end

endmodule