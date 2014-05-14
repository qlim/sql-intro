import random
import datetime

random.seed(0)
tx = []
for transactionId in range(1, 41):
    customerId = random.randint(1, 8)
    productId = random.randint(1, 6)
    timestamp = datetime.datetime(2013, 1, 1) + datetime.timedelta(random.uniform(0, 360)) 
    quantity = random.randint(1, 20)
    salesValue = random.randint(100, 1000) / 10.0 * quantity
    tx.append((transactionId, customerId, productId, timestamp, quantity,
               salesValue))

tx.sort(key=lambda x: x[3])

for t, ci, pi, ti, q, sv in tx:
    print """INSERT INTO Sales (transactionId, customerId, productId, timestamp,
    quantity, salesValue) VALUES (%d, %d, %d, datetime("%s"), %s, %s);""" % (
    t, ci, pi, ti.strftime("%Y-%m-%d %H:%M:%S"), q, sv)
