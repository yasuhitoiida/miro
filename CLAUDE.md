# CLAUDE.md

This file provides guidance to Claude Code (claude.ai/code) when working with code in this repository.

## Project Overview

This is a Rails 7.2 application called "Miro" that implements a post management system with tagging functionality. The application uses Single Table Inheritance (STI) for different post types.

## Key Architecture

### Models
- **Post** (base class): Uses STI with a `type` column. Has polymorphic relationships with User and Tags via join table.
- **LongPost/ShortPost**: Inherit from Post with different content length validations (40/20 chars max respectively).
- **PostsTags**: Join table managing many-to-many relationship between Posts and Tags.
- **Tag**: Simple model with name validation, connected to posts through PostsTags.
- **User**: Basic user model that owns posts.

### Controllers
- Posts are managed through specialized controllers: `posts_controller` (index/show/edit), `long_posts_controller` (new/create), `short_posts_controller` (new/create).
- Tags have their own controller for listing and creation.

### Database
- SQLite3 database with foreign key constraints
- Uses Rails migrations with proper indexing on foreign keys

## Development Commands

### Server and Console
```bash
bin/rails server          # Start development server
bin/rails console         # Rails console
```

### Database
```bash
bin/rails db:migrate      # Run pending migrations
bin/rails db:seed         # Load seed data
bin/rails db:schema:load  # Load schema (faster than migrations)
```

### Testing
```bash
bin/rails test           # Run all tests except system tests
bin/rails test:system    # Run system tests
bin/rails test test/models/post_test.rb  # Run specific test file
```

### Code Quality
```bash
bundle exec rubocop      # Run Ruby linter (Omakase style)
bundle exec brakeman     # Security vulnerability scanner
```

### Generators
```bash
bin/rails generate model ModelName  # Generate model
bin/rails generate controller ControllerName  # Generate controller
bin/rails generate migration MigrationName  # Generate migration
```

## Testing Framework

- Uses Rails' built-in testing framework (not RSpec)
- Tests run in parallel using all processor cores
- Fixtures are loaded from `test/fixtures/*.yml`
- System tests use Capybara with Selenium WebDriver