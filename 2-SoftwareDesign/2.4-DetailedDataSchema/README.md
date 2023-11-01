**Деталізований опис схеми даних мовою опису СКБД**

-- Таблиця Спортсмен
CREATE TABLE Sportsman(
    Id INT PRIMARY KEY, -- Унікальний ідентифікатор спортсмена
    Name VARCHAR(255), -- Ім'я спортсмена
    Bik INT, -- Ідентифікаційний номер спортсмена
    Address VARCHAR(255) -- Адреса спортсмена
);

-- Таблиця Тренувальні програми
CREATE TABLE TrainingProgram(
    Id INT PRIMARY KEY, -- Унікальний ідентифікатор тренувальної програми
    Name VARCHAR(255), -- Назва тренувальної програми
    Plan VARCHAR(255), -- План тренувань
    SportsmanId INT, -- Зовнішній ключ, посилається на унікальний ідентифікатор спортсмена
    FOREIGN KEY (SportsmanId) REFERENCES Sportsman(Id)
);

-- Таблиця Сповіщення про тренувальну програму
CREATE TABLE NotificationTrainingProgram(
    Id INT PRIMARY KEY, -- Унікальний ідентифікатор сповіщення про тренувальну програму
    Date DATE, -- Дата сповіщення
    Status VARCHAR(255), -- Статус тренувальної програми
    TrainingProgramId INT, -- Зовнішній ключ, посилається на унікальний ідентифікатор тренувальної програми
    FOREIGN KEY (TrainingProgramId) REFERENCES TrainingProgram(Id)
);

-- Таблиця Вибір тренувальної програми
CREATE TABLE SelectionTrainingProgram(
    Id INT PRIMARY KEY, -- Унікальний ідентифікатор вибору тренувальної програми
    Date DATE, -- Дата вибору
    Duration INT, -- Тривалість тренувань
    TrainingProgramId INT, -- Зовнішній ключ, посилається на унікальний ідентифікатор тренувальної програми
    NotificationTrainingProgramId INT, -- Зовнішній ключ, посилається на унікальний ідентифікатор сповіщення про тренувальну програму
    FOREIGN KEY (TrainingProgramId) REFERENCES TrainingProgram(Id),
    FOREIGN KEY (NotificationTrainingProgramId) REFERENCES NotificationTrainingProgram(Id)
);

-- Таблиця Експерт
CREATE TABLE Expert(
    Id INT PRIMARY KEY, -- Унікальний ідентифікатор експерта
    Name VARCHAR(255) -- Ім'я експерта
);

-- Таблиця Відповідь на Online-повідомлення
CREATE TABLE OnlineNotificationResponse(
    Id INT PRIMARY KEY, -- Унікальний ідентифікатор відповіді на онлайн-повідомлення
    Date DATE, -- Дата відповіді
    Text VARCHAR(255), -- Текст відповіді
    ExpertId INT, -- Зовнішній ключ, посилається на унікальний ідентифікатор експерта
    FOREIGN KEY (ExpertId) REFERENCES Expert(Id)
);

-- Зв'язок між Спортсмен та Відповідь на Online-повідомлення
CREATE TABLE SportsmanOnlineNotificationResponse(
    SportsmanId INT, -- Зовнішній ключ, посилається на унікальний ідентифікатор спортсмена
    OnlineNotificationResponseId INT, -- Зовнішній ключ, посилається на унікальний ідентифікатор відповіді на онлайн-повідомлення
    PRIMARY KEY (SportsmanId, OnlineNotificationResponseId),
    FOREIGN KEY (SportsmanId) REFERENCES Sportsman(Id),
    FOREIGN KEY (OnlineNotificationResponseId) REFERENCES OnlineNotificationResponse(Id)
);
-- Додавання первинного ключа до таблиці Sportsman
ALTER TABLE Sportsman ADD ( sportsman_id INT PRIMARY KEY );

-- Додавання первинного ключа до таблиці TrainingProgram
ALTER TABLE TrainingProgram ADD ( trainingprogram_id INT PRIMARY KEY );

-- Додавання поля зарплати в таблиці Expert
ALTER TABLE Expert ADD salary FLOAT;
-- Додавання обмеження для поля зарплати в таблиці Expert, переконуємося, що зарплата завжди позитивна
ALTER TABLE Expert ADD CONSTRAINT salary_check CHECK ( salary > 0 );

-- Додавання нового стовпчика для мобільного номера в таблиці Sportsman
ALTER TABLE Sportsman ADD mobile_phone CHAR(14);

-- Додавання обмеження для формату мобільного номера, переконуємося, що він відповідає вказаному формату
ALTER TABLE Sportsman ADD CONSTRAINT mobile_format_check
  CHECK (REGEXP_LIKE(mobile_phone, '^(([0-9]{3}))?[0-9]{3}-[0-9]{4}$'));

-- Додавання стовпчика для електронної пошти в таблиці Sportsman
ALTER TABLE Sportsman ADD email VARCHAR(100);
-- Додавання обмеження для формату електронної пошти, переконуємося, що вона відповідає стандартному формату
ALTER TABLE Sportsman ADD CONSTRAINT email_check 
  CHECK (REGEXP_LIKE(email, '^[A-Za-z0-9._%-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,4}$'));
