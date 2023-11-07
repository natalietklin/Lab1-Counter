module counter #(
    parameter WIDTH = 8
)(
    // interface signals
    input logic              clk,    // clock    
    input logic              rst,    // reset
    input logic              en,     // counter enable
    output logic [WIDTH-1:0] count   // count output
);

always_ff @ (posedge clk)
    if (rst)        count <= {WIDTH{1'b0}}; // Concatenation operator to form WIDTH bits of "0"
    else if (en)    count <= count + {{WIDTH-1{1'b0}}, en}; // Concatenation operator forms WIDTH-1 bits of "0" with the LSB being en
    else            count <= count - {{WIDTH-1{1'b0}}, !en}; // en = 0 so !en = 1 for the LSB

endmodule
