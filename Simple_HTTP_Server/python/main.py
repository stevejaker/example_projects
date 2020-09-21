#!/usr/bin/env python3
# main.py

if __name__ == '__main__':
    from Simple_HTTP_Server import app #, config
    host = '0.0.0.0'
    port = 8080
    app.run(host=host, port=port)
