# Git Gist Clone

A GitHub Gist clone built with **Elixir**, **Phoenix**, and **Phoenix LiveView**.

This project allows users to register, log in, and manage gists through a clean and minimal interface inspired by GitHub Gist.

---

## 🚀 Tech Stack

* Elixir
* Phoenix Framework
* Phoenix LiveView
* PostgreSQL
* TailwindCSS

---

## ✨ Features

* User registration
* User authentication (log in / log out)
* Session management
* Create gists
* View gists
* User dropdown menu
* Responsive layout

---

## 🛠 Installation

### 1️⃣ Clone the repository

```bash
git clone https://github.com/jopotew/git_gist_clone.git
cd git_gist_clone
```

### 2️⃣ Install dependencies

```bash
mix deps.get
```

### 3️⃣ Setup the database

```bash
mix ecto.create
mix ecto.migrate
```

### 4️⃣ Run the server

```bash
mix phx.server
```

Open your browser at:

```
http://localhost:4000
```

---

## 📂 Project Structure

```
lib/
  git_gist_clone/
  git_gist_clone_web/
    controllers/
    live/
    components/
    templates/
```

---

## 🔐 Authentication Routes

* /users/register
* /users/log-in
* /users/log-out
* /users/settings

---

## 🎯 Future Improvements

* Public / private gists
* Syntax highlighting
* Save / favorite gists
* User profiles
* Pagination
* JSON API

---

## 🧑‍💻 Author

Built as a learning project using Elixir and Phoenix.
