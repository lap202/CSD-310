# Andrew Bach
# 11/26/23
# Module 7 assignment

import mysql.connector
from mysql.connector import errorcode

config = {
    "user": "movies_user",
    "password": "popcorn",
    "host": "127.0.0.1",
    "database": "movies",
    "raise_on_warnings": True
}

try:
    db = mysql.connector.connect(**config)

    cursor = db.cursor()

    # Get all studios
    cursor.execute("SELECT * FROM studio;")
    studios = cursor.fetchall()

    # Get all Genres
    cursor.execute("SELECT * FROM genre;")
    genres = cursor.fetchall()

    # Get films shorter than 2 hours
    cursor.execute("SELECT film_name, film_runtime FROM movies.film WHERE film_runtime < 120;")
    shortFilms = cursor.fetchall()

    # Get directors in order
    cursor.execute("SELECT film_name, film_director FROM movies.film ORDER BY film_director;")
    films = cursor.fetchall()

    print("-- DISPLAYING Studio RECORDS --")
    for studio in studios:
        print(f"Studio ID: {studio[0]}")
        print(f"Studio Name: {studio[1]}\n")

    print("-- DISPLAYING Genre RECORDS --")
    for genre in genres:
        print(f"Genre ID: {genre[0]}")
        print(f"Genre Name: {genre[1]}\n")

    print("-- DISPLAYING Short Film RECORDS --")
    for film in shortFilms:
        print(f"Film Name: {film[0]}")
        print(f"Runtime: {film[1]}\n")

    print("-- DISPLAYING Director RECORDS in Order --")
    for film in films:
        print(f"Film Name: {film[0]}")
        print(f"Director: {film[1]}\n")

except mysql.connector.Error as err:
    print(err)

finally:
    db.close()