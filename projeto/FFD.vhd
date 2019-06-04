LIBRARY IEEE;
USE IEEE.STD_LOGIC_1164.ALL;

-- Flip-flop tipo D usando procedure

ENTITY FFD IS
        PORT(d, clock : IN  std_logic;
             q, notq  : OUT std_logic);
END FFD;

ARCHITECTURE flipflop-d OF FFD IS

        PROCEDURE savedata (d, clock : IN  std_logic;
                            q, notq  : OUT std_logic) IS
                            
        BEGIN
                main: PROCESS(clock)
                BEGIN
                        IF clock'EVENT AND clock = '1' THEN
                                q <= d;
                                notq <= not d;
                        END IF;
                END PROCESS main;
        END main;

BEGIN
        savedata(d, clock, q, notq);
END flipflop-d;

-- Implementacao com set, reset e enable

ENTITY FFDRS IS
        PORT(d, clock, set, reset, enable : IN  std_logic;
             q, notq              : OUT std_logic);
END FFDRS;

ARCHITECTURE flipflop-rs OF FFDRS IS

        PROCEDURE savedata (d, clock, set, reset, enable : IN  std_logic;
                            q, notq              : OUT std_logic) IS
                            
        BEGIN
                main: PROCESS(clock)
                BEGIN
                        IF clock'EVENT AND clock = '1' THEN
                                IF enable = '1' THEN
                                        IF reset = '1' THEN
                                                q    <= '0';
                                                notq <= '1';
                                        ELSIF set = '1' THEN
                                                q    <= '1';
                                                notq <= '0';
                                        ELSE
                                                q    <= d;
                                                notq <= not d;
                                        END IF;
                                END IF;
                        END IF;
                END PROCESS main;
        END main;
        
BEGIN
        savedata(d, clock, set, reset, enable, q, notq);
END flipflop-rs;




