import mysql.connector
from datetime import date

# Returns the current local date

def display_report_countries(host, user, password, database, sql_query):
    db = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )

    cursor = db.cursor()

    cursor.execute(sql_query)
    all_rows = cursor.fetchall()

    # Get the column names
    column_names = [i[0] for i in cursor.description]
    print("\n")
    today = date.today()
    print("Date of Report: ", today)
    print("\n\t\tCountries Report: \n");

    # Calculate the maximum length of each column
    max_lengths = [len(name) for name in column_names]
    for row in all_rows:
        for i, value in enumerate(row):
            max_lengths[i] = max(max_lengths[i], len(str(value)))

    # Print the column headers
    for i, name in enumerate(column_names):
        print(f'{name.ljust(max_lengths[i])}', end=' | ')
    print()

    # Print the separator line
    print('-' * (sum(max_lengths) + len(max_lengths) * 3 - 1))

    # Print the rows
    for row in all_rows:
        for i, value in enumerate(row):
            print(f'{str(value).ljust(max_lengths[i])}', end=' | ')
        print()
    print ("\n******* END OF REPORT *****")
    cursor.close()
    db.close()

# Usage example
display_report_countries(
    host="127.0.0.1",
    user="OutlandAdventures_user",
    password="Explore",
    database="outlandadventures",
    sql_query='SELECT t.trip_name AS Trip, d.destination_name AS Location, d.destination_country AS Country, COUNT(r.registration_id) AS Registrations, YEAR(t.end_date) AS Year FROM trip t JOIN destination d ON t.destination_id = d.destination_id LEFT JOIN registration r ON t.trip_id = r.trip_id GROUP BY Trip, Location, Country, Year;'
)

def display_report_sales(host, user, password, database, sql_query):
    db = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )

    cursor = db.cursor()

    cursor.execute(sql_query)
    all_rows = cursor.fetchall()

    # Get the column names
    column_names = [i[0] for i in cursor.description]
    print("\n")

    # Calculate the maximum length of each column
    max_lengths = [len(name) for name in column_names]
    for row in all_rows:
        for i, value in enumerate(row):
            max_lengths[i] = max(max_lengths[i], len(str(value)))

    today = date.today()
    print("Date of Report: ", today)
    print("\n\t\tSales Report:  \n");
    # Print the column headers
    for i, name in enumerate(column_names):
        print(f'{name.ljust(max_lengths[i])}', end=' | ')
    print()

    # Print the separator line
    print('-' * (sum(max_lengths) + len(max_lengths) * 3 - 1))

    # Print the rows
    for row in all_rows:
        for i, value in enumerate(row):
            print(f'{str(value).ljust(max_lengths[i])}', end=' | ')
        print()

    print("\n******* END OF REPORT *****")
    cursor.close()
    db.close()

# Usage example
display_report_sales(
    host="127.0.0.1",
    user="OutlandAdventures_user",
    password="Explore",
    database="OutlandAdventures",
    sql_query='Select equipment_name AS Product, equipment_price AS Price, CONCAT("$ ", FORMAT(equipment_sales, 2)) AS "Sales Revenue" FROM Equipment;'

)

def display_equipment_age_report(host, user, password, database, sql_query):
    db = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )

    cursor = db.cursor()

    cursor.execute(sql_query)

    all_rows = cursor.fetchall()

    # Get the column names
    column_names = [i[0] for i in cursor.description]
    print("\n")
    today = date.today()
    print("Date of Report: ", today)
    print("\n\t\tEquipment Age Report:  \n");

    # Calculate the maximum length of each column
    max_lengths = [len(name) for name in column_names]
    for row in all_rows:
        for i, value in enumerate(row):
            max_lengths[i] = max(max_lengths[i], len(str(value)))

    # Print the column headers
    for i, name in enumerate(column_names):
        print(f'{name.ljust(max_lengths[i])}', end=' | ')
    print()

    # Print the separator line
    print('-' * (sum(max_lengths) + len(max_lengths) * 3 - 1))

    # Print the rows
    for row in all_rows:
        for i, value in enumerate(row):
            print(f'{str(value).ljust(max_lengths[i])}', end=' | ')
        print()

    print("\n******* END OF REPORT *****")
    cursor.close()
    db.close()

# Usage example
display_equipment_age_report(
    host="127.0.0.1",
    user="OutlandAdventures_user",
    password="Explore",
    database="outlandadventures",
    sql_query=f'SELECT equipment_name AS Equipment, equipment_ordered_date AS "Ordered Date", equipment_received_date AS "Received Date", DATEDIFF(CURDATE(), equipment_received_date) AS "Age in days", CONCAT("$ ", FORMAT(equipment_sales, 2)) AS "Product Revenue", IF(DATEDIFF(CURDATE(), equipment_received_date) > 1825, "*", "") AS "> 5 Years" FROM equipment ORDER BY `Age in days` DESC;'
)


def display_registrations_report(host, user, password, database, sql_query):
    db = mysql.connector.connect(
        host=host,
        user=user,
        password=password,
        database=database
    )

    cursor = db.cursor()

    cursor.execute(sql_query)

    all_rows = cursor.fetchall()

    # Get the column names
    column_names = [i[0] for i in cursor.description]
    print("\n")
    today = date.today()
    print("Date of Report: ", today)
    print("\n\t\tRegistration Data Report:  \n");

    # Calculate the maximum length of each column
    max_lengths = [len(name) for name in column_names]
    for row in all_rows:
        for i, value in enumerate(row):
            max_lengths[i] = max(max_lengths[i], len(str(value)))

    # Print the column headers
    for i, name in enumerate(column_names):
        print(f'{name.ljust(max_lengths[i])}', end=' | ')
    print()

    # Print the separator line
    print('-' * (sum(max_lengths) + len(max_lengths) * 3 - 1))

    # Print the rows
    for row in all_rows:
        for i, value in enumerate(row):
            print(f'{str(value).ljust(max_lengths[i])}', end=' | ')
        print()

    print("\n******* END OF REPORT *****")
    cursor.close()
    db.close()
display_registrations_report(
    host="127.0.0.1",
    user="OutlandAdventures_user",
    password="Explore",
    database="outlandadventures",
    sql_query=f'SELECT CONCAT(c.customer_fname," ", c.customer_lname) AS Customer, r.registration_date AS "Registration Date", t.trip_name AS "Trip Name:" , m.marketing_strategy AS "Campaign:", DATE_FORMAT(t.start_date, "%M %d, %Y") AS Start, DATE_FORMAT(t.end_date,"%M %d, %Y" ) AS End, CASE WHEN rental.rental_id IS NOT NULL THEN "Rental" ELSE "Purchase" END AS Equipment_status FROM Customer c join Registration r on c.customer_id = r.customer_id join Marketing m on m.marketing_campaign = r.marketing_campaign join Trip t on t.trip_id = r.trip_id LEFT OUTER JOIN rental ON rental.customer_id = r.customer_id AND rental_id IN (SELECT MAX(rental_id) FROM rental WHERE customer_id = r.customer_id);'
)

