This is a project for learning dbt. the following is the basic knowledge for dbt command line and how to set up the project.

## dbt (Data Build Tool)

`dbt` is a command-line tool that enables data analysts and engineers to transform data in their warehouse more effectively. It allows you to write modular SQL queries, test data quality, and document your data.

To install dbt on a Mac, follow these steps:

1. Install Homebrew if not already installed
2. If you're using an M1 Mac, install Rosetta first:
    
    ```bash
    /usr/sbin/softwareupdate --install-rosetta
    ```
    
3. Update Homebrew and install git:
    
    ```bash
    brew update
    brew install git
    ```
    
4. Add the dbt-labs tap:
    
    ```bash
    brew tap dbt-labs/dbt
    ```
    
5. create the python virtual env
    
    ```bash
    python3 -m venv dbtenv
    source dbtenv/bin/activate  # On macOS
    ```
    
6. Install dbt with the appropriate adapter for your database. For example, for Postgres:
    
    ```bash
    brew install dbt-postgres
    ```
    

Replace "postgres" with your specific database adapter (e.g., snowflake, bigquery, redshift)

To verify the installation, run:

```bash
dbt --version
```

To upgrade dbt in the future, use:

```bash
brew upgrade dbt-<adapter>
```

## DBT Project

- Create a .dbt folder in your root folder, here is the place to store the credentials such as profiles.yml
    
    ```bash
    mkdir ~/.dbt
    ```
    
- **Initialize a new dbt project:**
    
    ```bash
    dbt init project_name
    ```
    
- Run debug to check the connection
    
    ```bash
    dbt debug
    ```
    
- **Run dbt models:**
    
    ```bash
    dbt run
    # to refresh all incremental tables
    dbt run --full-refresh
    # seeds is to upload local files
    dbt seed
    ```
    
- **Test dbt models:**
    
    ```bash
    dbt test
    ```
    
- **Compile dbt models: check all the templates, sources and definitions are correct?**
    
    ```bash
    dbt compile
    ```
    
- **Generate documentation:**
    
    ```bash
    dbt docs generate
    ```
    
- **Serve documentation:**
    
    ```bash
    dbt docs serve
    ```