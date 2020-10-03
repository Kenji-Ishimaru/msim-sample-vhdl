-- =======================================================================
--                          Sample Project
-- 
--  File:
--    test_1.vhd
-- 
--  Abstract:
--    test scenario 1
-- 
--   Created:
--     2 February 2016
-- ======================================================================
-- 
--  Copyright (c) 2016, Kenji Ishimaru
--  All rights reserved.
-- 
--  Redistribution and use in source and binary forms, with or without
--  modification, are permitted provided that the following conditions are met:
-- 
--   -Redistributions of source code must retain the above copyright notice,
--    this list of conditions and the following disclaimer.
--   -Redistributions in binary form must reproduce the above copyright notice,
--    this list of conditions and the following disclaimer in the documentation
--    and/or other materials provided with the distribution.
-- 
--  THIS SOFTWARE IS PROVIDED BY THE COPYRIGHT HOLDERS AND CONTRIBUTORS "AS IS"
--  AND ANY EXPRESS OR IMPLIED WARRANTIES, INCLUDING, BUT NOT LIMITED TO,
--  THE IMPLIED WARRANTIES OF MERCHANTABILITY AND FITNESS FOR A PARTICULAR
--  PURPOSE ARE DISCLAIMED. IN NO EVENT SHALL THE COPYRIGHT HOLDER OR
--  CONTRIBUTORS BE LIABLE FOR ANY DIRECT, INDIRECT, INCIDENTAL, SPECIAL,
--  EXEMPLARY, OR CONSEQUENTIAL DAMAGES (INCLUDING, BUT NOT LIMITED TO,
--  PROCUREMENT OF SUBSTITUTE GOODS OR SERVICES; LOSS OF USE, DATA, OR PROFITS;
--  OR BUSINESS INTERRUPTION) HOWEVER CAUSED AND ON ANY THEORY OF LIABILITY,
--  WHETHER IN CONTRACT, STRICT LIABILITY, OR TORT (INCLUDING NEGLIGENCE OR
--  OTHERWISE) ARISING IN ANY WAY OUT OF THE USE OF THIS SOFTWARE,
--  EVEN IF ADVISED OF THE POSSIBILITY OF SUCH DAMAGE.
--  

library IEEE;
use IEEE.std_logic_1164.all;
use IEEE.std_logic_arith.all;
use IEEE.math_real.all;

entity test_module is
end test_module;

architecture testbench of test_module is
component mod_top is
  port (
    clk : in std_logic;
    rst_x: in std_logic;
    i_in : in std_logic_vector(7 downto 0);
    o_out : out std_logic_vector(7 downto 0)
  );
end component;
signal clk : std_logic;
signal rst_x : std_logic := '0';
signal i_in : std_logic_vector(7 downto 0) := (others => '0');
signal o_out : std_logic_vector(7 downto 0);
signal sim_end : boolean := false;
signal rand_num : integer := 0;
constant CK_CYCLE : time := 10 ns; -- 100MHz

procedure reset(signal rst_x : out std_logic) is
begin
  rst_x <= '0';
  for i in 0 to 9 loop
    wait until clk'event and clk='1';
  end loop;
  wait until clk'event and clk='0';
  rst_x <= '1';
  wait until clk'event and clk='1';
end reset;

begin
  u_mod_top : mod_top port map (
    clk => clk,
    rst_x => rst_x,
    i_in => i_in,
    o_out => o_out
  );
  clkg : process begin
    clk <= '0';
    wait for CK_CYCLE/2;
    clk <= '1';
    wait for CK_CYCLE/2;
    if (sim_end) then 
      wait;
    end if;
  end process;

  main : process
    variable seed1, seed2: positive;
    variable rand: real;
    variable range_of_rand : real := 255.0;
  begin 
    report "ModelSim simulation sample";
    reset(rst_x);
    report "reset end";
    for i in 0 to 9 loop
      uniform(seed1, seed2, rand);
      rand_num <= integer(rand*range_of_rand);
      i_in <= conv_std_logic_vector(rand_num, 8);
      wait until clk'event and clk='1';
    end loop;
    for i in 0 to 9 loop
      wait until clk'event and clk='1';
    end loop;
    report "simulation finished.";
    sim_end <= true;
    wait;
  end process;               
end testbench;
