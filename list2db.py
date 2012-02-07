import sys
import codecs

import pymongo


connection = pymongo.Connection()

db = connection['haffen']
items = db['items']

for line in codecs.open(sys.argv[1], encoding='utf-8'):
	data = line.strip().split('\t')
	item = {}
	item['pronunciation'] = data[1]
	item['word'] = data[2]
	item['type'] = data[3]
	item['translation'] = data[4]
	print(item)
	items.insert(item)
