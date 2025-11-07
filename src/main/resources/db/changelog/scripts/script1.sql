CREATE SCHEMA utmn;

CREATE TABLE utmn.student
(
    id                         bigserial                           NOT NULL,
    fio                        varchar(128)                        NOT NULL,
    passport                   varchar(20)                         NOT NULL
);
COMMENT ON TABLE utmn.student IS 'Таблица для хранения информации о судентах';

COMMENT ON COLUMN utmn.student.fio IS 'ФИО';
COMMENT ON COLUMN utmn.student.passport IS 'Серия и номер паспорта студента';