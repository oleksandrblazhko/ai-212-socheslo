CREATE OR REPLACE FUNCTION selectTrainingProgram (
    p_sportsman_id IN VARCHAR2,
    p_program_name IN VARCHAR2,
    p_duration IN INT
)
RETURN INT IS
    v_sportsman_id training.sportsman_id%TYPE := TRIM(upper(p_sportsman_id));
    v_program_name training.program_name%TYPE := TRIM(upper(p_program_name));
    v_duration training.duration%TYPE := p_duration;
    v_program_id training.program_id%TYPE;
BEGIN
    -- Умова №1: Довжина рядка ID спортсмена повинна бути до 50 символів.
    IF LENGTH(v_sportsman_id) > 50 THEN
        RETURN -2; -- Помилка: ID спортсмена не відповідає умовам.
    END IF;

    -- Умова №2: ID спортсмена повинен бути унікальним.
    BEGIN
        SELECT program_id INTO v_program_id FROM training WHERE sportsman_id = v_sportsman_id AND ROWNUM = 1;
        RETURN -2; -- Помилка: ID спортсмена не відповідає умовам.
    EXCEPTION WHEN NO_DATA_FOUND THEN
        NULL; -- ID спортсмена відповідає умовам.
    END;

    -- Умова №3: Довжина рядка назви тренувальної програми повинна бути до 100 символів.
    IF LENGTH(v_program_name) > 100 THEN
        RETURN -3; -- Помилка: Назва тренувальної програми не відповідає умовам.
    END IF;

    -- Умова №4: Тривалість тренувальної програми повинна бути більше 5 днів.
    IF v_duration <= 5 THEN
        RETURN -4; -- Помилка: Тривалість тренувальної програми не відповідає умовам.
    END IF;

    -- Вставка запису про обрану тренувальну програму.
    INSERT INTO training (sportsman_id, program_name, duration) VALUES (v_sportsman_id, v_program_name, v_duration);
    COMMIT;

    RETURN 1; -- Спортсмен успішно обрав тренувальну вправу.
END;
/
