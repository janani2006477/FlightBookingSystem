from flask import Flask, render_template, request, redirect, session
import mysql.connector
import random

app = Flask(__name__)
app.secret_key = "secret123"

conn = mysql.connector.connect(
    host="localhost",
    user="root",
    password="janani@22",
    database="flight_booking"
)

@app.route('/')
def home():
    return render_template('home.html')

@app.route('/register', methods=['GET', 'POST'])
def register():
    if request.method == 'POST':
        name = request.form['name']
        email = request.form['email']
        phone = request.form['phone']
        password = request.form['password']

        cursor = conn.cursor()
        cursor.execute(
            "INSERT INTO Passenger (name, email, phone, password) VALUES (%s, %s, %s, %s)",
            (name, email, phone, password)
        )
        conn.commit()
        return redirect('/login')

    return render_template('register.html')

@app.route('/login', methods=['GET', 'POST'])
def login():
    if request.method == 'POST':
        email = request.form['email']
        password = request.form['password']

        cursor = conn.cursor()
        cursor.execute(
            "SELECT * FROM Passenger WHERE email=%s AND password=%s",
            (email, password)
        )
        user = cursor.fetchone()

        if user:
            session['passenger_id'] = user[0]
            return redirect('/flights')
        else:
            return render_template('login.html', error="Invalid email or password. Please try again.")

    return render_template('login.html')

@app.route('/flights')
def flights():
    cursor = conn.cursor()
    cursor.execute("SELECT * FROM Flight")
    flights = cursor.fetchall()
    return render_template('flights.html', flights=flights)

@app.route('/book/<int:flight_id>')
def book(flight_id):
    if 'passenger_id' not in session:
        return redirect('/login')

    passenger_id = session['passenger_id']
    cursor = conn.cursor()

    cursor.execute(
        "INSERT INTO Booking (status, passenger_id) VALUES (%s, %s)",
        ("Confirmed", passenger_id)
    )
    conn.commit()
    booking_id = cursor.lastrowid

    seat_number = "A" + str(random.randint(1, 30))
    ticket_class = random.choice(["Economy", "Business"])
    price = 3000 if ticket_class == "Economy" else 6000

    cursor.execute(
        "INSERT INTO Ticket (seat_number, class, price, booking_id, flight_id) VALUES (%s, %s, %s, %s, %s)",
        (seat_number, ticket_class, price, booking_id, flight_id)
    )
    conn.commit()

    payment_method = random.choice(["UPI", "Credit Card", "Debit Card"])
    payment_status = "Paid"

    cursor.execute(
        "INSERT INTO Payment (amount, payment_method, payment_status, booking_id) VALUES (%s, %s, %s, %s)",
        (price, payment_method, payment_status, booking_id)
    )
    conn.commit()

    return render_template('booking_success.html',
        seat_number=seat_number,
        ticket_class=ticket_class,
        price=price,
        payment_method=payment_method,
        payment_status=payment_status
    )

@app.route('/logout')
def logout():
    session.clear()
    return redirect('/')

if __name__ == '__main__':
    app.run(host='0.0.0.0', port=5000, debug=True)