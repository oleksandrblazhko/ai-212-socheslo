DECLARE
    v_result INT;
BEGIN
    -- Виклик функції selectTrainingProgram
    v_result := selectTrainingProgram('Sportsman123', 'ProgramX', 7);

    -- Обробка результату
    IF v_result = 1 THEN
        DBMS_OUTPUT.PUT_LINE('Спортсмен успішно обрав тренувальну вправу.');
    ELSIF v_result = -2 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! ID спортсмена не відповідає умовам.');
    ELSIF v_result = -3 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Назва тренувальної програми не відповідає умовам.');
    ELSIF v_result = -4 THEN
        DBMS_OUTPUT.PUT_LINE('Помилка! Тривалість тренувальної програми не відповідає умовам.');
    END IF;
END;
/

