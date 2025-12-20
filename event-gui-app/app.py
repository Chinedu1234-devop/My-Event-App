from flask import Flask, render_template, request, redirect, url_for
import sqlite3

app = Flask(__name__)
DB_NAME = "events.db"

def get_db():
    conn = sqlite3.connect(DB_NAME)
    conn.row_factory = sqlite3.Row
    return conn

def init_db():
    conn = get_db()
    conn.execute("""
        CREATE TABLE IF NOT EXISTS events (
            id INTEGER PRIMARY KEY AUTOINCREMENT,
            name TEXT,
            date TEXT,
            location TEXT
        )
    """)
    conn.commit()
    conn.close()

# Initialize database at startup
init_db()

@app.route("/")
def index():
    conn = get_db()
    events = conn.execute("SELECT * FROM events").fetchall()
    conn.close()
    return render_template("index.html", events=events)

@app.route("/add", methods=["POST"])
def add_event():
    name = request.form["name"]
    date = request.form["date"]
    location = request.form["location"]

    conn = get_db()
    conn.execute(
        "INSERT INTO events (name, date, location) VALUES (?, ?, ?)",
        (name, date, location)
    )
    conn.commit()
    conn.close()
    return redirect(url_for("index"))

@app.route("/edit/<int:id>")
def edit_event(id):
    conn = get_db()
    event = conn.execute("SELECT * FROM events WHERE id=?", (id,)).fetchone()
    conn.close()
    return render_template("edit.html", event=event)

@app.route("/update/<int:id>", methods=["POST"])
def update_event(id):
    conn = get_db()
    conn.execute(
        "UPDATE events SET name=?, date=?, location=? WHERE id=?",
        (
            request.form["name"],
            request.form["date"],
            request.form["location"],
            id,
        ),
    )
    conn.commit()
    conn.close()
    return redirect(url_for("index"))

@app.route("/delete/<int:id>")
def delete_event(id):
    conn = get_db()
    conn.execute("DELETE FROM events WHERE id=?", (id,))
    conn.commit()
    conn.close()
    return redirect(url_for("index"))

if __name__ == "__main__":
    app.run(host="0.0.0.0", port=5000)
