# Quick Opal Workaround with SSL

This setup provides a Dockerized Opal instance with Nginx handling SSL termination using self-signed certificates.

## Prerequisites

*   Docker
*   Docker Compose
*   Git

## Setup Instructions

1.  Clone the repository:
    ```bash
    git clone https://github.com/davidsarratgonzalez/quick-opal-workaround.git
    cd quick-opal-workaround
    ```

2.  Run the startup script. This will generate SSL certificates (if not already present) and start the Docker containers:
    ```bash
    sh startup.sh
    ```
    Or, if you made it executable:
    ```bash
    ./startup.sh
    ```

3.  Access Opal in your browser at: `https://localhost:8443`

    You will likely see a browser warning about the self-signed certificate. You'll need to accept the risk to proceed.

## Services

*   **Opal**: Runs on `http://opal:8080` internally.
*   **Nginx**: 
    *   Listens on HTTP port 80 (host) and redirects to HTTPS.
    *   Listens on HTTPS port 8443 (host), terminates SSL, and proxies to Opal.
*   Various database services (Mongo, MySQL, MariaDB, PostgreSQL).
*   Rock R server.

## SSL Certificates

The self-signed SSL certificates (`nginx.crt` and `nginx.key`) are generated in the `nginx/ssl/` directory by the `bin/generate-ssl.sh` script (which is called by `startup.sh`).

These certificates are ignored by Git (see `.gitignore`).
