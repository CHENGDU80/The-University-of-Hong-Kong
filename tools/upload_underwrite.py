import os
from supabase import create_client, Client
import random
from data import datas
from faker import Faker

random.seed(1)

f = open("./key.txt")
url = f.readline().strip()
key = f.readline().strip()

supabase: Client = create_client(url, key)
arr = []

faker = Faker()

for i in range(20):
    d = random.choice(datas)
    am = random.randint(10000, 100000)
    appr = random.choice([True, False])
    arr.append(
        {
            "amount": str(am),
            "image": d["image"],
            "name": d["name"],
            "brand": d["brand"],
            "model": d["model"],
            "vin": str(faker.vin()),
            "mile": str(random.randint(0, 10000)),
            "year_manufactor": str(random.randint(2000, 2023)),
            "history_drive": str(random.randint(0, 30)),
            "address": str(faker.address()),
            "birth": random.choice(
                [
                    "1990-12-01",
                    "1995-2-21",
                    "1990-05-17",
                    "1990-03-12",
                    "1990-01-01",
                    "1990-05-22",
                ]
            ),
            "occupation": random.choice(
                [
                    "Quant trader",
                    "Software Developer",
                    "Physicist",
                    "Driver",
                    "Chef",
                    "Teacher",
                ]
            ),
            "email": faker.name() + "@qq.com",
            "phone": str(faker.phone_number()),
            "expiry": str(random.randint(2025, 2030))
            + "-"
            + str(random.randint(1, 12))
            + "-"
            + str(random.randint(1, 30)),
            "issued": str(random.randint(2020, 2025))
            + "-"
            + str(random.randint(1, 12))
            + "-"
            + str(random.randint(1, 30)),
            "document": "contract.pdf",
        }
    )
# for i in arr:
#     print(i)
response = supabase.table("underwrite").upsert(arr).execute()
