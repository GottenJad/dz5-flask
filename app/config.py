import os
class Config:

    SQLALCHEMY_DATABASE_URI = os.getenv(
        "DATABASE_URL",
        "postgresql+psycopg2://flask:flask@db:5432/flaskdb",
    )

    SQLALCHEMY_TRACK_MODIFICATIONS = False
    REDIS_URL = os.getenv("REDIS_URL", "redis://redis:6379/0")
    TASKS_CACHE_TTL = int(os.getenv("TASKS_CACHE_TTL", "60"))