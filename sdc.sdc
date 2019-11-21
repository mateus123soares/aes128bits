create_clock -period 8.000 -name osc_clk clkW
set_input_delay -clock osc_clk 0.1 [all_inputs]
set_output_delay -clock osc_clk 0.1 [all_outputs]
derive_pll_clocks
derive_clock_uncertainty