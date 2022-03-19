# Minimum Distance Pattern Recognition (Backend)

This part contain all the information to execute the __*Backend*__

> 📱 [Frontend](https://github.com/Kike10hd/vdoctor_frontend.git)

## Requirements

1. [Python 3](https://www.python.org/downloads/)
1. Make a virtual environment
> Example with [Virtualenv](https://pypi.org/project/virtualenv/)

⚠️ For use the file request.rest you need to download the extensions for vscode [rest client](https://marketplace.visualstudio.com/items?itemName=humao.rest-client)  

## How Configure?

1. Create a virtual environment
```bash
virtualenv .venv
```
2. Activate Virtualenv

> Unix 
```bash
source ./.venv/bin/activate
```
> Windows 

```bash
.\.venv\Scripts\activate.bat
```
3. Install all requirements

```bash
pip install -r requirements.txt
```
## How Run?

1. Go to src
```bash
cd src
```

2. Execute 
```bash
uvicorn app:app --reload
```

## Contributing

Pull requests are welcome. For major changes, please open an issue first to discuss what you would like to change.

Please make sure to update tests as appropriate.

## License

[MIT](https://choosealicense.com/licenses/mit/)
