# Laravel Pastebin API

## How to setup
1. Clone this repository
1. run $composer update
1. Setup db connection in .env
1. Import database dump in folder : '/database/20210420_db_init.sql'
1. run $php artisan serve

## How to use
1. Open url : http://localhost:8000
1. Login admin :
    1. admin@admin.com / admin
        This user can access to user menu and notes
    1. user@user.com / user
        this user can access to notes menu only.
