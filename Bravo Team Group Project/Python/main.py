from Database import Database
from enum import Enum
from Models.TableEnum import Tables
from prettytable import PrettyTable

# This gets every all records from the provided table and prints them in a pretty table
def GetFormattedTable(tableenum):
    # Print the table name
    print(f"{tableenum.value.upper()} TABLE")
    # Create pretty tables with the information in the database
    table = PrettyTable()
    table.field_names = db.getColumnNames(tableenum)

    # Set the alignment of the table to left
    table.align = "l"

    # Get all records from the table
    records = db.SelectAll(tableenum)
    for record in records:
        table.add_row(record)

    # Print the table
    print(table)
    print("\n")


try:
    db = Database()
    db.BuildDatabase()

    # Get tables
    GetFormattedTable(Tables.registration)
    GetFormattedTable(Tables.customer)
    GetFormattedTable(Tables.airfare)
    GetFormattedTable(Tables.trip)
    GetFormattedTable(Tables.employee)
    GetFormattedTable(Tables.guide)
    GetFormattedTable(Tables.destination)
    GetFormattedTable(Tables.marketing)
    GetFormattedTable(Tables.equipment)
    GetFormattedTable(Tables.rental)
    GetFormattedTable(Tables.product)
    

except Exception as err:
    print(err)

finally:
    try:
        db.Close()
    except:
        print("The Database failed to close due to it never being created.")
