from fastapi import FastAPI, Request
from fastapi.responses import HTMLResponse
from fastapi.templating import Jinja2Templates
from esxi import esxi_vms_info
import os

app = FastAPI()

templates_dir = os.path.join(os.path.dirname(__file__), "templates")

templates = Jinja2Templates(directory=templates_dir)

@app.get("/", response_class=HTMLResponse)
async def esxi(request: Request):
    try:
        vm_details = esxi_vms_info()
        return templates.TemplateResponse("index.html", {"request": request, "vm_details": vm_details})
    
    except Exception as e:
        return HTMLResponse(content="An error occurred", status_code=500)
