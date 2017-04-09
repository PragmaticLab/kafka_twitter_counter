import sys
import psycopg2
from psycopg2.extensions import ISOLATION_LEVEL_AUTOCOMMIT

conn = psycopg2.connect(database="tcount", user="postgres", password="pass", host="localhost", port="5432")
cur = conn.cursor()

whereClause = ""
if len(sys.argv) > 1:
   whereClause = "WHERE word='%s'" % sys.argv[1].replace("'","").replace("\\","")

cur.execute("SELECT word, count FROM tweetwordcount " + whereClause + " ORDER BY word")
records = cur.fetchall()


if len(records) == 0:
   sys.exit(1)

if len(sys.argv) > 1:
   print """Total number of occurrences of of "%s": %d """ % (records[0][0], records[0][1])
else:
   for word, count in records:
	print "%s, %d" % (word, count)

