import os
from supabase import create_client, Client
import random
from data import datas

random.seed(1)

f = open("./key.txt")
url = f.readline().strip()
key = f.readline().strip()

supabase: Client = create_client(url, key)
arr = []

for i in range(10):
    d = random.choice(datas)
    am = random.randint(100000, 10000000)
    appr = random.choice([True, False])
    arr.append(
        {
            "title": d["title"],
            "amount": d["amount"],
            "description": d["description"],
            "contact": d["contact"],
            "confidence": random.randint(80, 100),
            "approved": appr,
            "image": d["image"],
            "name": d["name"],
            "age": random.randint(20, 30),
            "brand": d["brand"],
            "model": d["model"],
            "location": d["location"],
            "req_amount": am,
            "rem_amount": am if appr else am - random.randint(0, min(am, 10000000)),
            "human_inter": random.choice([True, False]),
        }
    )
response = supabase.table("claim").upsert(arr).execute()
