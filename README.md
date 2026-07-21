# Lawyer Directory Website

A lightweight, high-performance lawyer directory website built in Plain PHP. This project models a production directory focusing on clean slug-based URL architecture, SEO optimizations, structured relational data, and a premium responsive header layout.

---

## Technical Stack & Architecture

- **Backend**: Plain PHP 8.0+ (No framework overhead for maximum control and performance)
- **Database**: MySQL / MariaDB (Structured relational data with normalized schema)
- **Frontend**: Plain HTML5 & Vanilla CSS (Fast, responsive UI with reusable layouts and partials)
- **Web Server**: Apache with `mod_rewrite` enabled for SEO-friendly URLs

---

## Key Features

1. **Inline Navigation Search Bar**:
   - Integrates the directory search input directly in the site header inline (between the logo brand and the links/hamburger menu) across all devices.
   - Automatically hides the selects on mobile and uses collapsible elements (text search button collapses into a compact magnifying glass icon, brand text collapses on viewports `<= 480px`) to prevent vertical page clutter and fits cleanly on a single row.
2. **Normalized Dropdown & Select UI**:
   - Removes browser-default dropdown carets on select components.
   - Employs lightweight, custom inline SVG chevrons with responsive right-padding.
   - Implements automated text truncation (`text-overflow: ellipsis`) to prevent visual overlap in narrower layouts.
3. **Court Jurisdiction System**:
   - Integrated validation and support for storing and showcasing specific court jurisdictions (e.g., *High Court of Bombay*) for verified profiles.
   - Active on registration form flows, dashboard edits, and profile detail pages.

---

## Setup & Installation

### 1. Prerequisites
- **XAMPP** (or any local environment running Apache with `mod_rewrite` enabled and PHP 8.0+)
- **MySQL / MariaDB Server**

### 2. Database Initialization
1. Open your MySQL client (e.g., phpMyAdmin or CLI).
2. Create a database named `lawyer_directory`.
3. Import the database schema:
   ```sql
   source database/schema.sql
   ```
4. Import the seed data:
   ```sql
   source database/seed.sql
   ```
5. Apply the migration file to add court jurisdiction support:
   ```sql
   source database/add_jurisdiction_migration.sql
   ```

### 3. Connection Configuration
Configure database host, port, username, and password in:
[config/database.php](file:///c:/xampp/htdocs/lawyer-directory/config/database.php)

By default:
- **Host**: `127.0.0.1`
- **Port**: `3307` (Default or XAMPP port config)
- **Database Name**: `lawyer_directory`
- **Username**: `root`
- **Password**: ` ` (empty)

### 4. Running Locally via XAMPP
1. Move or clone this project folder into your Apache document root (typically `C:\xampp\htdocs\lawyer-directory`).
2. Verify Apache's `mod_rewrite` module is enabled in `httpd.conf` (`LoadModule rewrite_module modules/mod_rewrite.so`).
3. Ensure `.htaccess` files are allowed (`AllowOverride All` in your Apache directory configuration).
4. Restart Apache.
5. Open your browser and navigate to: `http://localhost/lawyer-directory/`

---

## Known Limitations

- **No Dedicated Routing Engine**: The application relies on manual query-string parameter mapping (`index.php?page=...`) combined with custom Apache `.htaccess` rules for pretty URLs. It lacks dynamic runtime parameter matching.
- **Manual Database Schema Management**: There is no database migration framework (e.g., Phinx). Schema updates and initial tables must be run manually via raw SQL scripts.
- **Basic Search Capability**: Directory searching is done using simple SQL `LIKE` wildcard matching. It lacks advanced full-text search capabilities, fuzzy matching, or relevance scoring (e.g., Elasticsearch).
- **Synchronous Workloads**: Operations like sending enquiries or processing submissions are run synchronously within the HTTP request lifecycle. There is no job queue or asynchronous worker system.
- **Minimal Security Features**: Uses a custom, basic CSRF token mechanism and native PHP sessions. It does not provide advanced security framework components like password reset flows, rate-limiting, session revocation, or token-based authentication.
