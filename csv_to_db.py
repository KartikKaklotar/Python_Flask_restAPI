import mysql.connector as mc
import csv

msdb = mc.connect(host="127.0.0.1",port=3306,user="kartik",password="root@123", database="games_portal")
print("Connected....")
cursor = msdb.cursor()

with open('games_data.csv' ) as csv_fl:
    data = list(csv.reader(csv_fl))
    for row in data[1:]:
        cursor.execute(f'insert into games (title, platform, score, genre, editors_choice) values(%s, %s, %s, %s, %s)',row)
        print(row)

msdb.commit()
cursor.close()

print('DONE')