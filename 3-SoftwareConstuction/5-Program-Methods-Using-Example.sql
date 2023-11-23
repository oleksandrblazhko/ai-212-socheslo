DECLARE
    v_count INT;
BEGIN
    SELECT COUNT(*) INTO v_count
    FROM Sportsmen
    WHERE Name = 'John' AND age = 25 AND address = '123_Street';

    IF v_count > 0 THEN
        DBMS_OUTPUT.PUT_LINE('Успішно!');
        DBMS_OUTPUT.PUT_LINE('Запис знайдено. Чекайте подальших вказівок.');
    ELSE
        DBMS_OUTPUT.PUT_LINE('Помилка! Запис не знайдено! Спробуйте, будь ласка, ще раз.');
    END IF;
END;
/
