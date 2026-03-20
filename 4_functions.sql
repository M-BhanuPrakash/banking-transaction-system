EMI Calculation Function

CREATE OR REPLACE FUNCTION calculate_emi(
p_amount NUMBER,
p_rate NUMBER,
p_months NUMBER
)
RETURN NUMBER
IS
v_r NUMBER;
v_emi NUMBER;
BEGIN

v_r := p_rate / (12 * 100);

v_emi := (p_amount * v_r * POWER(1 + v_r, p_months)) /
         (POWER(1 + v_r, p_months) - 1);

RETURN ROUND(v_emi,2);

END;
/
