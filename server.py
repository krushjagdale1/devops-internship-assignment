from fastapi import FastAPI

app = FastAPI()


@app.get("/")
async def root():
    return {"message": "Hello Everyone Welcome To DPDzero Technologies Private Limited "}
