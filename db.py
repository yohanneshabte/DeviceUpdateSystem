import mysql.connector
from mysql.connector import errorcode
import logging


class DB:
    user = 'root'
    password = ''
    host = 'localhost'
    db = 'dit'
    port = 3306

    def __init__(self):
        try:
            self.cnx = mysql.connector.connect(user=self.user, password=self.password, 
                                               host=self.host, db=self.db, port=self.port)
            self.cursor = self.cnx.cursor()
        except mysql.connector.Error as err:
            if err.errno == errorcode.ER_ACCESS_DENIED_ERROR:
                print("Something is wrong with your user name or password")
            elif err.errno == errorcode.ER_BAD_DB_ERROR:
                print("Database does not exist")
            else:
                print(err)

    def cursor(self):
        return self.cursor

    def execute(self, sql, params=None):
        self.cursor.execute(sql, params)

    def commit(self):
        self.cnx.commit()

    def closeCur(self):
        self.cursor.close()

    def closeConn(self):
        self.cnx.close()   

