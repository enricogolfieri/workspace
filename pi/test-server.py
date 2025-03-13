#!/usr/bin/env python3

from http.server import BaseHTTPRequestHandler, HTTPServer

class SimpleHTTPRequestHandler(BaseHTTPRequestHandler):
    def do_GET(self):
        self.send_response(200)
        self.send_header('Content-type', 'text/html')
        self.end_headers()
        self.wfile.write(b"<html><head><title>Test Server</title></head>")
        self.wfile.write(b"<body><h1>I am connected!</h1></body></html>")

def run():
    print('Starting server...')
    server_address = ('', 9000)
    httpd = HTTPServer(server_address, SimpleHTTPRequestHandler)
    print('Server running on port 9000...')
    httpd.serve_forever()

if __name__ == '__main__':
    run()
