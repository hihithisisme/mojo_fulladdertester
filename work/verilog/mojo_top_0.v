/*
   This file was generated automatically by the Mojo IDE version B1.3.6.
   Do not edit this file directly. Instead edit the original Lucid source.
   This is a temporary file and any changes made to it will be destroyed.
*/

module mojo_top_0 (
    input clk,
    input rst_n,
    output reg [7:0] led,
    input cclk,
    output reg spi_miso,
    input spi_ss,
    input spi_mosi,
    input spi_sck,
    output reg [3:0] spi_channel,
    input avr_tx,
    output reg avr_rx,
    input avr_rx_busy,
    output reg [23:0] io_led,
    output reg [7:0] io_seg,
    output reg [3:0] io_sel,
    input [4:0] io_button,
    input [23:0] io_dip,
    output reg outPin1,
    output reg outPin2,
    output reg outPin3,
    input inPinCarry,
    input inPinSum
  );
  
  
  
  reg rst;
  
  wire [1-1:0] M_reset_cond_out;
  reg [1-1:0] M_reset_cond_in;
  reset_conditioner_1 reset_cond (
    .clk(clk),
    .in(M_reset_cond_in),
    .out(M_reset_cond_out)
  );
  wire [3-1:0] M_caseCount_value;
  counter_2 caseCount (
    .clk(clk),
    .rst(rst),
    .value(M_caseCount_value)
  );
  
  wire [8-1:0] M_dec_out;
  reg [3-1:0] M_dec_in;
  decoder_3 dec (
    .in(M_dec_in),
    .out(M_dec_out)
  );
  
  always @* begin
    M_reset_cond_in = ~rst_n;
    rst = M_reset_cond_out;
    led = 8'h00;
    spi_miso = 1'bz;
    spi_channel = 4'bzzzz;
    avr_rx = 1'bz;
    io_led = 24'h000000;
    io_seg = 8'hff;
    io_sel = 4'hf;
    M_dec_in = M_caseCount_value;
    io_led[8+7-:8] = M_dec_out;
    io_led[16+0+0-:1] = io_dip[16+0+0-:1];
    if (io_dip[16+0+0-:1] == 1'h0) begin
      io_led[16+5+2-:3] = io_dip[16+5+2-:3];
      outPin1 = io_dip[16+7+0-:1];
      outPin2 = io_dip[16+6+0-:1];
      outPin3 = io_dip[16+5+0-:1];
      if (inPinCarry * 3'h2 + inPinSum == io_dip[16+7+0-:1] + io_dip[16+6+0-:1] + io_dip[16+5+0-:1]) begin
        io_led[0+0+0-:1] = 1'h1;
      end else begin
        io_led[0+0+0-:1] = 1'h0;
      end
    end else begin
      io_led[16+5+2-:3] = M_caseCount_value;
      outPin1 = M_caseCount_value[2+0-:1];
      outPin2 = M_caseCount_value[1+0-:1];
      outPin3 = M_caseCount_value[0+0-:1];
      if (inPinCarry * 3'h2 + inPinSum == M_caseCount_value[0+0-:1] + M_caseCount_value[1+0-:1] + M_caseCount_value[2+0-:1]) begin
        io_led[0+0+0-:1] = 1'h1;
      end else begin
        io_led[0+0+0-:1] = 1'h0;
      end
    end
    io_led[0+6+0-:1] = inPinCarry;
    io_led[0+7+0-:1] = inPinSum;
  end
endmodule
