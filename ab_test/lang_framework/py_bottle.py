from bottle import route, run

@route('/')
def home():
    article = {'name': 'hello', 'body':'world'}
    return article

def main():
    run(host='localhost', port=8081)

if __name__ == '__main__':
    main()

