<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Medication Adherence And Management Platform</title>
    <style>
        /* Global Reset */
        * {
            margin: 0;
            padding: 0;
            box-sizing: border-box;
        }

        /* Base Styling */
        body {
            font-family: 'Segoe UI', Tahoma, Geneva, Verdana, sans-serif;
            background-color: #f4faff;
            color: #333;
            line-height: 1.6;
        }

        /* Header Styling */
        header {
            background-color: #00796b;
            color: #fff;
            padding: 2rem 1.5rem;
            text-align: center;
            position: relative;
        }

        header h1 {
            font-size: 2.5rem;
            margin-bottom: 0.5rem;
        }

        header p {
            font-size: 1.2rem;
            color: #e0f7fa;
            margin-bottom: 1rem;
        }

        #clock {
            font-size: 1.5rem;
            margin-bottom: 1rem;
        }

        #dropdown-container {
            background-color: #fff;
            border-radius: 8px;
            box-shadow: 0 4px 8px rgba(0, 0, 0, 0.2);
            padding: 0.5rem;
            display: inline-block;
        }

        #info-dropdown {
            padding: 0.5rem;
            font-size: 1rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            cursor: pointer;
        }

        /* Container with Grid Layout (Quadrant Style) */
        .container {
            display: grid;
            grid-template-columns: repeat(auto-fit, minmax(300px, 1fr));
            gap: 2rem;
            padding: 3rem 2rem;
        }

        /* Centralize content in sections */
        section {
            background-color: #fff;
            padding: 2rem;
            border-radius: 12px;
            box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
            display: flex;
            flex-direction: column;
            align-items: center;
            text-align: center;
            gap: 1.5rem;
            transition: transform 0.2s ease-in-out;
        }

        section:hover {
            transform: translateY(-10px);
        }

        section h2 {
            font-size: 2rem;
            margin-bottom: 1rem;
            color: #00796b;
        }

        ul {
            list-style-type: none;
            font-size: 1.2rem;
            margin-bottom: 1rem;
        }

        ul li {
            margin-bottom: 0.8rem;
        }

        /* Button Styling */
        button {
            background-color: #00796b;
            color: #fff;
            border: none;
            padding: 0.75rem 1.5rem;
            cursor: pointer;
            border-radius: 8px;
            transition: background-color 0.3s ease;
            font-size: 1.1rem;
            margin: 0.5rem 0; /* Add space between buttons */
        }

        button:hover {
            background-color: #004d40;
        }

        /* Popup Styles */
        #popup {
            position: fixed;
            top: 0;
            left: 0;
            width: 100%;
            height: 100%;
            background: rgba(0, 0, 0, 0.6);
            display: flex;
            justify-content: center;
            align-items: center;
            opacity: 0;
            pointer-events: none;
            transition: opacity 0.3s ease-in-out;
        }

        .popup-content {
            background-color: #fff;
            padding: 2rem;
            border-radius: 8px;
            width: 350px;
            text-align: center;
            position: relative;
            box-shadow: 0 8px 20px rgba(0, 0, 0, 0.2);
        }

        .close-popup {
            position: absolute;
            top: 10px;
            right: 20px;
            font-size: 1.5rem;
            cursor: pointer;
            color: #444;
        }

        .show {
            opacity: 1;
            pointer-events: all;
        }

        /* Reminder Form */
        .reminder-form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            max-width: 300px;
            margin: 0 auto;
        }

        .reminder-form label {
            font-size: 1.1rem;
        }

        .reminder-form input[type="time"], .reminder-form input[type="date"], .reminder-form input[type="number"] {
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
        }

        .reminder-form button {
            align-self: center;
        }

        /* Calendar Form */
        .calendar-form {
            display: flex;
            flex-direction: column;
            gap: 1rem;
            max-width: 300px;
            margin: 0 auto;
        }

        .calendar-form label {
            font-size: 1.1rem;
        }

        .calendar-form input[type="date"] {
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
        }

        .calendar-form input[type="number"] {
            padding: 0.5rem;
            border: 1px solid #ddd;
            border-radius: 8px;
            font-size: 1rem;
        }

        .calendar-form button {
            align-self: center;
        }
        
#appointment-section {
    background-color: #fff;
    padding: 2rem;
    border-radius: 12px;
    box-shadow: 0 8px 15px rgba(0, 0, 0, 0.1);
    text-align: center;
}

#appointment-section h2 {
    font-size: 2rem;
    margin-bottom: 1rem;
    color: #00796b;
}

#appointment-details {
    font-size: 1.2rem;
    color: #333;
}

        /* Responsive Adjustments */
        @media (max-width: 768px) {
            header {
                padding: 1.5rem;
            }

            header h1 {
                font-size: 2rem;
            }

            header p {
                font-size: 1rem;
            }

            #clock {
                font-size: 1.2rem;
            }

            #info-dropdown {
                padding: 0.5rem;
                font-size: 0.9rem;
            }

            .container {
                grid-template-columns: 1fr;
                padding: 1.5rem;
                gap: 1rem;
            }

            section {
                padding: 1.5rem;
            }

            button {
                padding: 0.5rem 1rem;
            }

            .popup-content {
                width: 300px;
            }
        }
    </style>
</head>
<body>
    <header>
        <h1>MedSafe</h1>
        <p>Monitor your health, ensure medication adherence, and get real-time alerts on drug interactions.</p>
        <div id="clock"></div>
        <!-- Dropdown in Header -->
        <div id="dropdown-container">
            <select id="info-dropdown" onchange="displayInfo(this.value)">
                <option value="">Select Information</option>
                <option value="bpm">BPM</option>
                <option value="bp">Blood Pressure</option>
                <option value="past-drug-use">Past Drug Use</option>
                <option value="risk">Potential Risks</option>
                <option value="severity">Severity Detection Scale</option>
            </select>
        </div>
    </header>

    <main class="container">
        <section id="adherence-section">
            <h2>Medication Adherence</h2>
            <div id="medication-reminders">
                <p>Reminders for your prescribed medications:</p>
                <ul>
                    <c:forEach var="medication" items="${patient.medications}">
                        <li>
                            ${medication.name}: Take at ${medication.scheduleTime}
                            <c:if test="${!medication.taken}">
                                <form action="${pageContext.request.contextPath}/medication" method="post">
                                    <input type="hidden" name="medicationName" value="${medication.name}">
                                    <button type="submit">Mark Taken</button>
                                </form>
                            </c:if>
                            <c:if test="${medication.taken}">
                                <span style="color: green;">✓ Taken</span>
                            </c:if>
                        </li>
                    </c:forEach>
                </ul>
            </div>
        </section>

        <section id="interaction-section">
            <h2>Real-Time Drug Interaction Alerts</h2>
            <div id="alert-container">
                <p>No critical drug interactions detected. You're good to go!</p>
            </div>
        </section>

        <section id="pharmacy-section">
            <h2>Pharmacy and Refills</h2>
            <ul>
                <li>Medicine 1: Refill by <span>2024-10-10</span></li>
                <li>Medicine 2: Refill by <span>2024-10-15</span></li>
            </ul>
        </section>

        <section id="risk-section">
            <h2>Risk Management</h2>
            <ul>
                <li>Potential Drug Interactions: Check periodically.</li>
                <li>Allergy Information: Update when necessary.</li>
            </ul>
        </section>

        <section id="severity-section">
            <h2>Severity Detection</h2>
            <ul>
                <li>Severity Level: 3 (Moderate) - Further evaluation needed.</li>
            </ul>
        </section>

        <!-- Reminder Form Section -->
        <section id="reminder-section">
            <h2>Set Reminder</h2>
            <div class="reminder-form">
                <label for="reminder-time">Reminder Time:</label>
                <input type="time" id="reminder-time" name="reminderTime" required>

                <label for="reminder-date">Reminder Date:</label>
                <input type="date" id="reminder-date" name="reminderDate" required>

                <button type="submit">Set Reminder</button>
            </div>
        </section>

        <!-- Calendar Form Section -->
        <section id="calendar-section">
            <h2>Course Details</h2>
            <div class="calendar-form">
                <label for="course-start-date">Course Start Date:</label>
                <input type="date" id="course-start-date" name="courseStartDate" required>

                <label for="course-duration">Course Duration (days):</label>
                <input type="number" id="course-duration" name="courseDuration" min="1" required>

                <button type="submit">Set Course Details</button>
            </div>
        </section>
        
        <section id="appointment-section">
            <h2>Next Appointment</h2>
            <div id="appointment-details">
                <p>Date: <span>2024-10-01</span></p>
                <p>Time: <span>10:00 AM</span></p>
            </div>
        </section>
    </main>

    <!-- Popup for Medication Status -->
    <div id="popup">
        <div class="popup-content">
            <span class="close-popup" onclick="closePopup()">&times;</span>
            <p id="popup-text">Medication marked as taken.</p>
        </div>
    </div>

    <script>
        // Real-time clock
        function updateClock() {
            const now = new Date();
            const timeString = now.toLocaleTimeString();
            document.getElementById('clock').textContent = timeString;
        }

        // Update clock every second
        setInterval(updateClock, 1000);
        updateClock(); // Initial call to display time immediately

        // Demo popup to simulate marking medication as taken
        function showPopup(medication, time) {
            const popup = document.getElementById('popup');
            const popupText = document.getElementById('popup-text');
            popupText.innerHTML = `${medication} taken at ${time}.`;
            popup.classList.add('show');
        }

        // Close popup
        function closePopup() {
            const popup = document.getElementById('popup');
            popup.classList.remove('show');
        }

        // Real-time drug interaction demo
        function checkDrugInteractions() {
            // For demo purposes: Simulated alert for drug interactions
            const alertContainer = document.getElementById('alert-container');
            alertContainer.innerHTML = '<p style="color: red;">Warning: Possible interaction between Medication 2 and new prescription!</p>';
        }

        // Simulate interaction check after 5 seconds
        setTimeout(checkDrugInteractions, 5000);

        // Display content based on dropdown selection
        function displayInfo(value) {
            const infoContent = document.getElementById('alert-container');
            let content = '';

            switch(value) {
                case 'bpm':
                    content = '<p>BPM data: 75 beats per minute (average).</p>';
                    break;
                case 'bp':
                    content = '<p>Blood Pressure data: 120/80 mmHg (normal).</p>';
                    break;
                case 'past-drug-use':
                    content = '<p>Past Drug Use Records: Medication 1 (date), Medication 2 (date).</p>';
                    break;
                case 'risk':
                    content = '<p>Potential Risks: Drug interactions, allergy information.</p>';
                    break;
                case 'severity':
                    content = '<p>Severity Detection Scale: Scale from 1 (mild) to 5 (severe).</p>';
                    break;
                default:
                    content = '<p>Please select an option from the dropdown.</p>';
                    break;
            }

            infoContent.innerHTML = content;
        }
    </script>
</body>
</html>
