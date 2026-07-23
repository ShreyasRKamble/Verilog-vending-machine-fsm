module VM(
    input [1:0] din_i,
    input clk_i,
    input rst_i,
    output reg Pr_o,
    output reg Re_o
);

parameter S0 = 2'b00,
          S1 = 2'b01,
          S2 = 2'b10;

reg [1:0] ps, ns;

always @(posedge clk_i or posedge rst_i) begin
    if (rst_i)
        ps <= S0;
    else
        ps <= ns;
end

always @(*) begin
    ns = ps;

    case (ps)
        S0: begin
            if (din_i == 2'b10)      ns = S1;
            else if (din_i == 2'b11) ns = S2;
            else                     ns = S0;
        end

        S1: begin
            if (din_i == 2'b10)      ns = S2;
            else if (din_i == 2'b11) ns = S0;
            else                     ns = S1;
        end

        S2: begin
            if (din_i == 2'b10)      ns = S0;
            else if (din_i == 2'b11) ns = S0;
            else                     ns = S2;
        end

        default: ns = S0;
    endcase
end

always @(*) begin
    Pr_o = 1'b0;
    Re_o = 1'b0;

    case (ps)
        S1: begin
            if (din_i == 2'b11) begin
                Pr_o = 1'b1;
                Re_o = 1'b0;
            end
        end

        S2: begin
            if (din_i == 2'b10) begin
                Pr_o = 1'b1;
                Re_o = 1'b0;
            end 
            else if (din_i == 2'b11) begin
                Pr_o = 1'b1;
                Re_o = 1'b1;
            end
        end

        default: begin
            Pr_o = 1'b0;
            Re_o = 1'b0;
        end
    endcase
end

endmodule
