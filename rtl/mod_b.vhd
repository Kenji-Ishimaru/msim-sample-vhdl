-- =======================================================================
--                          Sample Project
-- 
--  File:
--    mod_b.vhd
-- 
--  Abstract:
--    module b
-- 
--   Created:
--     2  February 2016
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

entity mod_b is
  port (
    clk : in std_logic;
    rst_x: in std_logic;
    i_in : in std_logic_vector(7 downto 0);
    o_out : out std_logic_vector(7 downto 0)
  );
end mod_b;

architecture rtl of mod_b is
signal r_out : std_logic_vector(7 downto 0);
begin
  process (clk, rst_x) begin
    if (rst_x = '0') then
       r_out <= (others => '0');
    elsif (clk'event and clk = '1') then
      r_out <= not i_in;
    end if;
  end process;
  o_out <= r_out;
end rtl;

   
