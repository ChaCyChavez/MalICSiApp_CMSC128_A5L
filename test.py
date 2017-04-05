import MySQLdb as mysql
db = mysql.connect('localhost', 'root', 'root', 'malicsi');
cursor = db.cursor()
cursor.execute('call delete_account(4);')
print(cursor.fetchall())
