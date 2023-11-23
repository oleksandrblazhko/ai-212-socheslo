CREATE OR REPLACE FUNCTION expert_answer (
    p_id IN INT,
    p_name IN VARCHAR2
)
RETURN BOOLEAN IS
    v_id expert.id%Type := p_id;
    v_name expert.name%Type := TRIM(upper(p_name));
    v_expert_id expert.expert_id%Type;
BEGIN
    IF p_id <= 0 THEN
        RETURN FALSE;
    END IF;

    BEGIN
        SELECT expert_id INTO v_expert_id FROM expert WHERE expert_id = v_id AND TRIM(upper(name)) = v_name;
        RETURN TRUE;
    EXCEPTION WHEN NO_DATA_FOUND THEN
        RETURN FALSE;
    END;
END;
