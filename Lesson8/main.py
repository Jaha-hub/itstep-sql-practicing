import sqlite3

def create_users_table():
    #подключаемся к БД
    conn = sqlite3.connect("Lesson8.db")
    #для покдлюч БД
    cursor = conn.cursor()
    #метод екзекут нужен для запустка скл кода
    cursor.execute(
        """
        CREATE TABLE users(
        id INTEGER PRIMARY KEY AUTOINCREMENT,
        username VARCHAR(255) NOT NULL
        )
        """
    )
    #Нужен чтобы сохранить изменение
    conn.commit()
    conn.close()

create_users_table()