\c sql_fundamentals

-- functions are case-insensitive
CREATE OR REPLACE FUNCTION no_empty_object_array(count BIGINT, json_input JSON)
  RETURNS JSON AS
    $$
      BEGIN
        IF count > 0 THEN
          RETURN json_input;
        ELSE
          RETURN '[]'::JSON;
        END IF;
      END;
    $$
LANGUAGE plpgsql;