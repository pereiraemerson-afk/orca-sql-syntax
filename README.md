# SQL & Dataform SQLX Syntax for Orca

Syntax highlighting for SQL and Dataform `.sqlx` files in the [Orca](https://www.onorca.dev) editor.
Content-only plugin: it ships TextMate grammars and runs no code.

## Features

- **SQL dialects:** ANSI SQL, PostgreSQL, SQL Server (T-SQL), Oracle (PL/SQL), MySQL and BigQuery, case-insensitive.
- **Comments:** `--`, `#` and `/* … */`.
- **Strings:** single-quoted (with `''` escapes, `N'…'`), PostgreSQL dollar-quoted bodies (`$$ … $$`).
- **Identifiers:** `"quoted"`, `[bracketed]` and `` `backticked` ``.
- **Parameters:** `@var`, `@@ROWCOUNT`, `:bind`, `$1`, `?`.
- **Keywords:** DML, DDL, control flow, operators (`AND`, `LIKE`, `IS`…), data types (including `INT64`, `JSONB`, `NVARCHAR`…), constants and function calls.
- **Operators:** `::`, `->`, `->>`, `@>`, `||` and the usual comparison ones.
- **Dataform SQLX:** the `config { … }` / `js { … }` blocks highlighted as JavaScript, `${ref("…")}`, `${self()}` and `${when(…)}` interpolations (also inside strings), and `pre_operations` / `post_operations` blocks.
- **Editing:** `--` line comments, `/* */` block comments, auto-closing brackets and quotes.

## File types

`.sql` `.ddl` `.dml` `.pgsql` `.psql` `.mysql` `.tsql` `.plsql` `.pls` `.pks` `.pkb` `.prc` `.fnc` `.trg` `.hql` `.bql`
and `.sqlx` (Dataform).

## Install

In Orca: Settings → Plugins, search for **SQL & Dataform SQLX Syntax**, or from the CLI:

    orca plugin install pereiraemerson-afk/orca-sql-syntax

## License

MIT
