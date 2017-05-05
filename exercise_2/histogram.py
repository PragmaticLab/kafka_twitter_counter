import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

nums = sys.argv[1].split(",")
whereClause = "WHERE count>=%s and count <=%s" % (nums[0], nums[1])

cur.execute("SELECT word, count FROM tweetwordcount " + whereClause)
records = cur.fetchall()


if len(records) == 0:
   sys.exit(1)


for word, count in records:
    print "%s: %d" % (word, count)

